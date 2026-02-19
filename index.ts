import express from 'express';
import cors from 'cors';
import attendanceRoutes from './routes/attendance.routs.js';
import studentRoutes from './routes/student.routes.js';
import authRoutes from './routes/auth.route.js';
const app=express();
app.use(cors());
app.use(express.json());
app.use('/api/attendances',attendanceRoutes);
app.use('/api/students',studentRoutes);
app.use('/api/auth',authRoutes);
const PORT=process.env.PORT || 5000;
app.listen(PORT,()=>{
    console.log(`Server is running on port ${PORT}`);
})
