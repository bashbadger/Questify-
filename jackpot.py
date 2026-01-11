import random
from flask import Flask, jsonify, render_template

app = Flask(__name__)

# Mock Database (In production, use MongoDB or Firebase)
data = {
    "jackpot": 1540.25,
    "users": [
        {"name": "Jonathan", "xp": 1250},
        {"name": "Sarah_Dev", "xp": 1100},
        {"name": "ADHD_King", "xp": 900}
    ]
}

def mask_name(name):
    return name[:2] + "*" * 5

@app.route('/leaderboard')
def get_leaderboard():
    # Masking for privacy and sorting by XP
    masked_list = [
        {"name": mask_name(u['name']), "xp": u['xp']} 
        for u in sorted(data['users'], key=lambda x: x['xp'], reverse=True)
    ]
    return jsonify({
        "jackpot": data['jackpot'],
        "leaderboard": masked_list
    })

@app.route('/add_to_jackpot', methods=['POST'])
def update_pool():
    # Logic for ad-revenue contribution
    data['jackpot'] += 0.01
    return jsonify({"new_total": data['jackpot']})

if __name__ == "__main__":
    app.run(debug=True)
