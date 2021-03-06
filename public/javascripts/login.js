$(document).ready(function () {

    function addStudent() {
        var addStudentForm = document.getElementsByName('add-new-student-form')[0];
        addStudentForm.submit();
        addStudentForm.reset();
        return false;
    }

    function addQuiz() {
        var addQuizForm = document.getElementsByName('create-new-quiz-form')[0];
        addQuizForm.submit();
        addQuizForm.reset();
        return false;
    }

    function submitQuiz() {
        var submitQuizForm = document.getElementsByName('student-take-quiz-form')[0];
        submitQuizForm.submit();
        submitQuizForm.reset();
        return false;
    }

    var addNewStudentButton = document.getElementById('add-new-student');

    if ( addNewStudentButton !== null ) {
      addNewStudentButton.addEventListener('click', addStudent);
    }

    var submitQuizButton = document.getElementById('submit-quiz');

    if ( submitQuizButton !== null ) {
      submitQuizButton.addEventListener('click', submitQuiz);
    }

    var submitQuizButton = document.getElementById('create-new-quiz');

    if ( submitQuizButton !== null ) {
      submitQuizButton.addEventListener('click', addQuiz);
    }

});
