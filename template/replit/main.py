from flask import Flask, render_template, request, jsonify
import random

app = Flask(__name__)

# Mock Database
users = {
    "Hero_1": {"xp": 850, "real_name": "Marcus"},
    "Hero_2": {"xp": 720, "real_name": "Sarah"},
}

@app.route('/')
def home():
    # Masking logic for the leaderboard
    leaderboard = []
    for uid, data in users.items():
        masked = data['real_name'][:2] + "*" * 5
        leaderboard.append({"name": masked, "xp": data['xp']})
    
    # Sort by XP
    leaderboard = sorted(leaderboard, key=lambda x: x['xp'], reverse=True)
    return render_template('index.html', leaderboard=leaderboard, pool=1450.50)

@app.route('/complete_task', methods=['POST'])
def complete():
    data = request.json
    dread = int(data.get('dread', 1))
    base_xp = 50
    earned = int(base_xp * (1 + (dread / 10)))
    return jsonify({"earned": earned, "msg": "Quest Complete! Ad Loading..."})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
