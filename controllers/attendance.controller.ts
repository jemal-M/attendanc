import { Request,Response } from "express";
import { db } from "../config/db.js";
export const getAttendances=async(req:Request,res:Response)=>{
    try {
        const [rows]=await db.query('SELECT * FROM attendances');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({message:'Internal Server Error'});
    }
}
export const getAttendanceById=async(req:Request,res:Response)=>{
    const {id}=req.params;
    try {
        const [rows]=await db.query('SELECT * FROM attendances WHERE id=?',[id]);
        if(rows.length===0){
            return res.status(404).json({message:'Attendance not found'});
        }
        res.json(rows[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({message:'Internal Server Error'});
    }
}
export const createAttendance=async(req:Request,res:Response)=>{
    const {student_id,date,status}=req.body;
    try {
        const [result]=await db.query('INSERT INTO attendances (student_id,date,status) VALUES (?,?,?)',[student_id,date,status]);
        res.status(201).json({id:result.insertId,student_id,date,status});
    } catch (error) {
        console.error(error);
        res.status(500).json({message:'Internal Server Error'});
    }
}
export const updateAttendance=async(req:Request,res:Response)=>{
    const {id}=req.params;
    const {student_id,date,status}=req.body;
    try {
        const [result]=await db.query('UPDATE attendances SET student_id=?,date=?,status=? WHERE id=?',[student_id,date,status,id]);
        if(result.affectedRows===0){
            return res.status(404).json({message:'Attendance not found'});
        }
        res.json({id,student_id,date,status});
    } catch (error) {
        console.error(error);
        res.status(500).json({message:'Internal Server Error'});
    }
}
export const deleteAttendance=async(req:Request,res:Response)=>{
    const {id}=req.params;
    try {
        const [result]=await db.query('DELETE FROM attendances WHERE id=?',[id]);
        if(result.affectedRows===0){
            return res.status(404).json({message:'Attendance not found'});
        }
        res.json({message:'Attendance deleted successfully'});
    } catch (error) {
        console.error(error);
        res.status(500).json({message:'Internal Server Error'});
    }
}
