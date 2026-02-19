import  { Request,Response } from "express";
import { db } from "../config/db.js";
export const getStudents=async(req:Request,res:Response)=>{
    try {
        const [rows]=await db.query('SELECT * FROM students');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({message:'Internal Server Error'});
    }
}
export const getStudentById=async(req:Request,res:Response)=>{
    const {id}=req.params;
    try {
        const [rows]=await db.query('SELECT * FROM students WHERE id=?',[id]);
        if(rows.length===0){
            return res.status(404).json({message:'Student not found'});
        }
        res.json(rows[0]);
    }
        catch (error) {
        console.error(error);        res.status(500).json({message:'Internal Server Error'});
    }
}
export const createStudent=async(req:Request,res:Response)=>{
    const {name,email}=req.body;
    try {
        const [result]=await db.query('INSERT INTO students (name,email) VALUES (?,?)',[name,email]);
        res.status(201).json({id:result.insertId,name,email});
    } catch (error) {
        console.error(error);
        res.status(500).json({message:'Internal Server Error'});
    }
}
export const updateStudent=async(req:Request,res:Response)=>{
    const {id}=req.params;
    const {name,email}=req.body;
    try {
        const [result]=await db.query('UPDATE students SET name=?,email=? WHERE id=?',[name,email,id]);
        if(result.affectedRows===0){
            return res.status(404).json({message:'Student not found'});
        }
        res.json({id,name,email});
    } catch (error) {
        console.error(error);
        res.status(500).json({message:'Internal Server Error'});
    }
}
export const deleteStudent=async(req:Request,res:Response)=>{
    const {id}=req.params;
    try {
        const [result]=await db.query('DELETE FROM students WHERE id=?',[id]);
        if(result.affectedRows===0){
            return res.status(404).json({message:'Student not found'});
        }
        res.json({message:'Student deleted successfully'});
    } catch (error) {
        console.error(error);
        res.status(500).json({message:'Internal Server Error'});
    }
}