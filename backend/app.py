from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from models import db, Employee
from config import Config

app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)

@app.route('/api/employees', methods=['GET', 'POST'])
def employees():
    if request.method == 'GET':
        return jsonify([e.to_dict() for e in Employee.query.all()])
    elif request.method == 'POST':
        data = request.json
        emp = Employee(name=data['name'], department=data['department'])
        db.session.add(emp)
        db.session.commit()
        return jsonify(emp.to_dict()), 201

if __name__ == '__main__':
    app.run(host='0.0.0.0')
