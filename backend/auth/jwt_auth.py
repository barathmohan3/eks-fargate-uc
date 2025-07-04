from flask import request, jsonify
import jwt
from functools import wraps

def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('Authorization', '').replace('Bearer ', '')
        if not token:
            return jsonify({'message': 'Token is missing'}), 403
        try:
            decoded = jwt.decode(token, options={"verify_signature": False})
            # You can verify claims here if needed
        except Exception as e:
            return jsonify({'message': 'Token is invalid'}), 403
        return f(*args, **kwargs)
    return decorated
