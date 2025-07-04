import React, { useState } from 'react';

function EmployeeForm() {
  const [name, setName] = useState('');
  const [department, setDepartment] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    fetch('/api/employees', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ name, department })
    }).then(() => {
      setName('');
      setDepartment('');
    });
  };

  return (
    <form onSubmit={handleSubmit}>
      <input value={name} onChange={e => setName(e.target.value)} placeholder="Name" />
      <input value={department} onChange={e => setDepartment(e.target.value)} placeholder="Department" />
      <button type="submit">Update Info</button>
    </form>
  );
}

export default EmployeeForm;
