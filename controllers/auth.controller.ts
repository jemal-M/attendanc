import { Request,Response } from "express";
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { db } from "../config/db.js";
export const login=async(req:Request,res:Response)=>{
    const {email,password}=req.body;
    const [rows]=await db.query('SELECT * FROM users WHERE email=?',[email]);
    if(rows.length===0){
        return res.status(401).json({message:'Invalid email or password'});
    }
    const user=rows[0];
    const isPasswordValid=await bcrypt.compare(password,user.password);
    if(!isPasswordValid){
        return res.status(401).json({message:'Invalid email or password'});
    }
    const token=jwt.sign({id:user.id,email:user.email},process.env.JWT_SECRET!,{expiresIn:'1h'});
    res.json({token});
}
export const register=async(req:Request,res:Response)=>{
    const {email,password}=req.body;
    const [rows]=await db.query('SELECT * FROM users WHERE email=?',[email]);
    if(rows.length>0){
        return res.status(400).json({message:'Email already exists'});
    }
    const hashedPassword=await bcrypt.hash(password,10);
    const [result]=await db.query('INSERT INTO users (email,password) VALUES (?,?)',[email,hashedPassword]);
    res.status(201).json({id:result.insertId,email});
}

