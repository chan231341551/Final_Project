<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<style>

 	.container {
		width: 70%;
		min-width: 50%;
		margin: auto;
		display: flex;
		flex-direction: column;
	}
	
	.kanban-heading {
		display: flex;
		flex-direction: row;
		justify-content: center;
		font-family: sans-serif;
	}
	
	.kanban-board {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		font-family: sans-serif;
	}
	
	.kanban-heading-text {
		font-size: 1.8rem;
		/* background-color: tomato; */
		padding: 0.8rem 1.7rem;
		border-radius: 0.5rem;
		margin: 1rem;
	}
	
	.kanban-block, .create-new-task-block {
		padding: 0.6rem;
		width: 30.5%;
		min-width: 14rem;
		min-height: 4.5rem;
		border-radius: 0.3rem;
	}
	
	#todo {
		background-color: #ffffff;
	}
	
	#inprogress {
		background-color: #ffffff;
		/* display: none; */
	}
	
	#done {
		background-color: #ffffff;
		/* display: none; */
	}
	
	.task {
		background-color: white;
		margin: 0.2rem 0rem 0.3rem 0rem;
		border: 0.1rem solid black;
		border-radius: 0.2rem;
		padding: 0.5rem 0.2rem 0.5rem 2rem;
	}
	
	#task-button {
		margin: 0.2rem 0rem 0.1rem 0rem;
		background-color: white;
		border-radius: 0.2rem;
		width: 100%;
		border: 0.25rem solid black;
		padding: 0.5rem 2.7rem;
		border-radius: 0.3rem;
		font-size: 1rem;
	}
	
	.create-new-task-block {
		display: none;
		/* display: flex; */
		background: #ffaf00;
		width: 64.4%;
		flex-direction: column;
	}
	
	.form-row {
		display: flex;
		flex-direction: row;
		margin: 0.2rem;
	}
	
	.form-row-label {
		width: 15%;
		padding: 0.2rem;
		padding-right: 0.5rem;
		border: 0.1rem solid black;
		border-right: 0;
		border-radius: 0.2rem 0rem 0rem 0.2rem;
	}
	
	.form-row-input {
		border: 0.1rem solid black;
		border-radius: 0rem 0.2rem 0.2rem 0rem;
		width: 85%;
	}
	
	textarea {
		resize: none;
	}
	
	.form-row-buttons {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin: 0.2rem;
	}
	
	#edit-button, #save-button, #cancel-button {
		margin: 0.2rem 0rem 0.1rem 0rem;
		background-color: white;
		border-radius: 0.2rem;
		width: 49.2%;
		border: 0.25rem solid black;
		padding: 0.5rem 2.7rem;
		border-radius: 0.3rem;
		font-size: 1rem;
	}
	
	#edit-button {
		display: none;
	}
</style>


<main class="content" style="padding-top:0px;">
	<div class="container-fluid p-0">
		<div class="row">
			<div class="col-md-4 col-xl-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">작업 칸반보드</h5>
					</div>
					<div class="card-body">
					    <div class="kanban-board">
					        <div class="kanban-block bg-light" id="todo" ondrop="drop(event)" ondragover="allowDrop(event)">
					            <strong>To Do</strong>
					            <div class="task-button-block">
					                <button id="task-button" onclick="createTask()">작업 생성</span>
					            </div>
					            <div class="task" id="task1" draggable="true" ondragstart="drag(event)">
					                <span>작업 1</span>
					            </div>
					            <div class="task" id="task2" draggable="true" ondragstart="drag(event)">
					                <span>작업 2</span>
					            </div>
					            <div class="task" id="task3" draggable="true" ondragstart="drag(event)">
					                <span>작업 3</span>
					            </div>
					            <div class="task" id="task4" draggable="true" ondragstart="drag(event)">
					                <span>작업 4</span>
					            </div>
					            <div class="task" id="task5" draggable="true" ondragstart="drag(event)">
					                <span>작업 5</span>
					            </div>
					        </div>
					        <div class="kanban-block bg-light" id="inprogress" ondrop="drop(event)" ondragover="allowDrop(event)">
					            <strong>In Progress</strong>
					        </div>
					        <div class="kanban-block bg-light" id="done" ondrop="drop(event)" ondragover="allowDrop(event)">
					            <strong>Done</strong>
					        </div>
					        <div class="create-new-task-block bg-light" id="create-new-task-block">
					            <strong>New Task</strong>
					            <span class="form-row">
					                <label class="form-row-label" for="task-name">Task</label>
					                <input class="form-row-input" type="text" name="task-name" id="task-name">
					            </span>
					            <span class="form-row">
					                <label class="form-row-label" for="task-name">Description</label>
					                <textarea class="form-row-input" name="task-description" id="task-description" cols="70" rows="10"></textarea>
					            </span>
					            <span class="form-row">
					                <label class="form-row-label" for="task-name">Status</label>
					                <select class="form-row-input" name="task-status" id="task-status">
					                    <option value="todo">To Do</option>
					                    <option value="inprogress">In Progress</option>
					                    <option value="done">Done</option>
					                </select>
					            </span>
					            <span class="form-row-buttons">
					                <button id="edit-button" onclick="editTask()">Edit</span>
					                <button id="save-button" onclick="saveTask()">Save</span>
					                <button id="cancel-button" onclick="createTask()">Cancel</span>
					            </span>
					        </div>
					    </div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</main>

<script>
	function drag(ev) {
	    ev.dataTransfer.setData("text", ev.target.id);
	}
	
	function allowDrop(ev) {
	    ev.preventDefault();
	}
	
	function drop(ev) {
	    ev.preventDefault();
	    var data = ev.dataTransfer.getData("text");
	    console.log(data);
	    ev.currentTarget.appendChild(document.getElementById(data));
	}
	
	function createTask(){
	    var x = document.getElementById("inprogress");
	    var y = document.getElementById("done");
	    var z = document.getElementById("create-new-task-block");
	    if (x.style.display === "none") {
	        x.style.display = "block";
	        y.style.display = "block";
	        z.style.display = "none";
	    } else {
	        x.style.display = "none";
	        y.style.display = "none";
	        z.style.display = "flex";
	    }
	}
	
	function saveTask(){
	    var saveButton = document.getElementById("save-button");
	    var editButton = document.getElementById("edit-button");
	    if (saveButton.style.display === "none") {
	        saveButton.style.display = "block";
	        editButton.style.display = "none";
	    } else{
	        saveButton.style.display = "none";
	        editButton.style.display = "block";
	    }
	
	    var todo = document.getElementById("todo");
	    var taskName = document.getElementById("task-name").value;
	    todo.innerHTML += `
	    <div class="task" id="${taskName.toLowerCase().split(" ").join("")}" draggable="true" ondragstart="drag(event)">
	        <span>${taskName}</span>
	    </div>
	    `
	}
	
	function editTask(){
	    var saveButton = document.getElementById("save-button");
	    var editButton = document.getElementById("edit-button");
	    if (saveButton.style.display === "none") {
	        saveButton.style.display = "block";
	        editButton.style.display = "none";
	    } else{
	        saveButton.style.display = "none";
	        editButton.style.display = "block";
	    }
	}
</script>
