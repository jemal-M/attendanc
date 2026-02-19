import express from "express";
import { getStudents,getStudentById,createStudent,updateStudent,deleteStudent } from "../controllers/student.controller.js";
const router=express.Router();

router.get('/',authMiddleware,adminMiddleware,getStudents);
router.get('/:id',authMiddleware,getStudentById);
router.post('/',authMiddleware,adminMiddleware,createStudent);
router.put('/:id',authMiddleware,adminMiddleware,updateStudent);
router.delete('/:id',authMiddleware,adminMiddleware,deleteStudent);
export default router;
