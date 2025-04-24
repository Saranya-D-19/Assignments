using System.Collections.Generic;
using SIS.entity;

namespace SIS.DAO
{
    public interface IStudentDAO
    {
        void AddStudent(Student student);
        Student GetStudentById(int studentId);
        List<Student> GetAllStudents();
        void UpdateStudent(Student student);
        void DeleteStudent(int studentId);
    }
}
