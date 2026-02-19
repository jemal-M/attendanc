import express from "express";
const router=express.Router();
import { getAttendances,getAttendanceById,createAttendance,updateAttendance,deleteAttendance } from "../controllers/attendance.controller.js";
import { adminMiddleware, authMiddleware } from "../middleware/auth.js";

router.get('/',authMiddleware,adminMiddleware,getAttendances);
router.get('/:id',authMiddleware,adminMiddleware,getAttendanceById);
router.post('/',authMiddleware,adminMiddleware,createAttendance);
router.put('/:id',authMiddleware,adminMiddleware,updateAttendance);
router.delete('/:id',authMiddleware,adminMiddleware,deleteAttendance);
export default router;