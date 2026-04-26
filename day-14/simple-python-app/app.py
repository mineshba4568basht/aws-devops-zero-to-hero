from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, world!'

if __name__ == '__main__':
    # Enable debug mode for local development and bind to all interfaces
    app.run(host='0.0.0.0', port=5000, debug=True)
