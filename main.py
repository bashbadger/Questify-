from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.slider import Slider
from kivy.uix.button import Button
from kivy.clock import Clock
from plyer import accelerometer # Cross-platform sensor access

class QuestFundMobile(App):
    def build(self):
        self.xp = 0
        self.layout = BoxLayout(orientation='vertical', padding=20, spacing=10)
        
        # 1. Jackpot Display
        self.jackpot_label = Label(text="JACKPOT: $1540.25", font_size='32sp', color=(1, 0.84, 0, 1))
        self.layout.add_widget(self.jackpot_label)

        # 2. Dread-O-Meter
        self.layout.add_widget(Label(text="Select Dread Factor"))
        self.dread_slider = Slider(min=1, max=10, value=5)
        self.layout.add_widget(self.dread_slider)

        # 3. Guardian Engine Status
        self.status_label = Label(text="Guardian: Standby", color=(0.5, 0.5, 0.5, 1))
        self.layout.add_widget(self.status_label)

        # 4. Action Button
        self.btn = Button(text="START QUEST", background_color=(0, 1, 0.5, 1))
        self.btn.bind(on_press=self.start_quest)
        self.layout.add_widget(self.btn)

        return self.layout

    def start_quest(self, instance):
        try:
            accelerometer.enable()
            self.status_label.text = "Guardian: TRACKING MOVEMENT"
            self.status_label.color = (0, 1, 0, 1)
            # Schedule the sensor check every 1 second
            Clock.schedule_interval(self.check_movement, 1.0)
        except NotImplementedError:
            self.status_label.text = "Guardian: Sensor Error (Use Real Device)"

    def check_movement(self, dt):
        val = accelerometer.acceleration
        # Basic Guardian Logic: If phone moves, add XP
        if val and (abs(val[0]) > 0.5 or abs(val[1]) > 0.5):
            self.xp += int(10 * (self.dread_slider.value / 5))
            self.btn.text = f"XP EARNED: {self.xp}"
        else:
            self.status_label.text = "Guardian: NO MOVEMENT DETECTED"
            self.status_label.color = (1, 0, 0, 1)

if __name__ == "__main__":
    QuestFundMobile().run()
