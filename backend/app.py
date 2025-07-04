from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from models import db, Employee
from config import Config
from auth.jwt_auth import token_required

app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)

@app.before_first_request
def create_tables():
    db.create_all()

@app.route('/api/employees', methods=['GET'])
@token_required
def get_employees():
    employees = Employee.query.all()
    return jsonify([e.to_dict() for e in employees])

@app.route('/api/employees', methods=['POST'])
@token_required
def create_employee():
    data = request.json
    emp = Employee(name=data['name'], department=data['department'])
    db.session.add(emp)
    db.session.commit()
    return jsonify(emp.to_dict()), 201

@app.route('/api/employees/<int:id>', methods=['PUT'])
@token_required
def update_employee(id):
    emp = Employee.query.get_or_404(id)
    data = request.json
    emp.name = data.get('name', emp.name)
    emp.department = data.get('department', emp.department)
    db.session.commit()
    return jsonify(emp.to_dict())

@app.route('/api/employees/<int:id>', methods=['DELETE'])
@token_required
def delete_employee(id):
    emp = Employee.query.get_or_404(id)
    db.session.delete(emp)
    db.session.commit()
    return jsonify({'message': 'Deleted successfully'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
