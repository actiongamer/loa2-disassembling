package org.specter3d.geom
{
   import flash.display.Graphics;
   import away3d.primitives.LineSegment;
   import away3d.entities.SegmentSet;
   import flash.geom.Vector3D;
   
   public class Triangle
   {
      
      public static const EPSILON:Number = 1.0E-6;
      
      public static const SIDE_AB:int = 0;
      
      public static const SIDE_BC:int = 1;
      
      public static const SIDE_CA:int = 2;
       
      
      private var _pointA:org.specter3d.geom.Vector2f;
      
      private var _pointB:org.specter3d.geom.Vector2f;
      
      private var _pointC:org.specter3d.geom.Vector2f;
      
      private var _center:org.specter3d.geom.Vector2f;
      
      public var sides:Vector.<org.specter3d.geom.Line2D>;
      
      private var dataCalculated:Boolean = false;
      
      private var _maxLengthWithCenter:Number = 0;
      
      public function Triangle(param1:org.specter3d.geom.Vector2f = null, param2:org.specter3d.geom.Vector2f = null, param3:org.specter3d.geom.Vector2f = null)
      {
         super();
         if(param1)
         {
            this.pointA = param1.clone();
         }
         if(param2)
         {
            this.pointB = param2.clone();
         }
         if(param3)
         {
            this.pointC = param3.clone();
         }
         dataCalculated = false;
      }
      
      public function getSaveData() : Object
      {
         var _loc1_:Object = {};
         _loc1_.pointA = {
            "x":pointA.x,
            "y":pointA.y
         };
         _loc1_.pointB = {
            "x":pointB.x,
            "y":pointB.y
         };
         _loc1_.pointC = {
            "x":pointC.x,
            "y":pointC.y
         };
         return _loc1_;
      }
      
      public function setPoints(param1:org.specter3d.geom.Vector2f, param2:org.specter3d.geom.Vector2f, param3:org.specter3d.geom.Vector2f) : void
      {
         this.pointA = param1.clone();
         this.pointB = param2.clone();
         this.pointC = param3.clone();
         dataCalculated = false;
      }
      
      protected function calculateData() : void
      {
         if(_center == null)
         {
            _center = pointA.clone();
         }
         else
         {
            _center.setVector2f(pointA);
         }
         _center.addLocal(pointB).addLocal(pointC).multLocal(0.333333333333333);
         if(sides == null)
         {
            sides = new Vector.<org.specter3d.geom.Line2D>();
         }
         sides[0] = new org.specter3d.geom.Line2D(pointA,pointB);
         sides[1] = new org.specter3d.geom.Line2D(pointB,pointC);
         sides[2] = new org.specter3d.geom.Line2D(pointC,pointA);
         var _loc1_:* = 0;
         _loc1_ = Number((_center.x - pointA.x) * (_center.x - pointA.x) + (_center.y - pointA.y) * (_center.y - pointA.y));
         if(_loc1_ > _maxLengthWithCenter)
         {
            _maxLengthWithCenter = _loc1_;
         }
         _loc1_ = Number((_center.x - pointB.x) * (_center.x - pointB.x) + (_center.y - pointB.y) * (_center.y - pointB.y));
         if(_loc1_ > _maxLengthWithCenter)
         {
            _maxLengthWithCenter = _loc1_;
         }
         _loc1_ = Number((_center.x - pointC.x) * (_center.x - pointC.x) + (_center.y - pointC.y) * (_center.y - pointC.y));
         if(_loc1_ > _maxLengthWithCenter)
         {
            _maxLengthWithCenter = _loc1_;
         }
         dataCalculated = true;
      }
      
      public function getVertex(param1:int) : org.specter3d.geom.Vector2f
      {
         switch(int(param1))
         {
            case 0:
               return pointA;
            case 1:
               return pointB;
            case 2:
               return pointC;
         }
      }
      
      public function setVertex(param1:int, param2:org.specter3d.geom.Vector2f) : void
      {
         switch(int(param1))
         {
            case 0:
               pointA = param2.clone();
               break;
            case 1:
               pointB = param2.clone();
               break;
            case 2:
               pointC = param2.clone();
         }
         dataCalculated = false;
      }
      
      public function getSide(param1:int) : org.specter3d.geom.Line2D
      {
         if(dataCalculated == false)
         {
            calculateData();
         }
         return sides[param1];
      }
      
      public function isPointIn(param1:org.specter3d.geom.Vector2f) : Boolean
      {
         var _loc2_:int = 0;
         if(dataCalculated == false)
         {
            calculateData();
         }
         if(param1.distanceSquared(_center) > _maxLengthWithCenter)
         {
            return false;
         }
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            if(sides[_loc2_].classifyPointQuick(param1,1.0e-6) == 2)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public function clone() : Triangle
      {
         return new Triangle(pointA.clone(),pointB.clone(),pointC.clone());
      }
      
      public function toString() : String
      {
         return "Triangle:" + pointA + " -> " + pointB + " -> " + pointC;
      }
      
      public function draw(param1:Graphics) : void
      {
         param1.beginFill(65280,0.5);
         param1.moveTo(this.pointA.x,this.pointA.y);
         param1.lineTo(this.pointB.x,this.pointB.y);
         param1.lineTo(this.pointC.x,this.pointC.y);
         param1.lineTo(this.pointA.x,this.pointA.y);
         param1.endFill();
      }
      
      public function drawTriangle(param1:SegmentSet) : Vector.<LineSegment>
      {
         var _loc6_:Vector.<LineSegment> = new Vector.<LineSegment>();
         var _loc8_:Vector3D = new Vector3D(pointA.x,0,pointA.y);
         var _loc4_:Vector3D = new Vector3D(pointB.x,0,pointB.y);
         var _loc3_:Vector3D = new Vector3D(pointC.x,0,pointC.y);
         var _loc2_:LineSegment = new LineSegment(_loc8_,_loc4_,16711680,16711680,2);
         param1.addSegment(_loc2_);
         _loc6_.push(_loc2_);
         var _loc7_:LineSegment = new LineSegment(_loc4_,_loc3_,16711680,16711680,2);
         param1.addSegment(_loc7_);
         _loc6_.push(_loc7_);
         var _loc5_:LineSegment = new LineSegment(_loc3_,_loc8_,16711680,16711680,2);
         param1.addSegment(_loc5_);
         _loc6_.push(_loc5_);
         return _loc6_;
      }
      
      public final function get pointA() : org.specter3d.geom.Vector2f
      {
         return _pointA;
      }
      
      public final function set pointA(param1:org.specter3d.geom.Vector2f) : void
      {
         _pointA = param1;
      }
      
      public final function get pointB() : org.specter3d.geom.Vector2f
      {
         return _pointB;
      }
      
      public final function set pointB(param1:org.specter3d.geom.Vector2f) : void
      {
         _pointB = param1;
      }
      
      public final function get pointC() : org.specter3d.geom.Vector2f
      {
         return _pointC;
      }
      
      public final function set pointC(param1:org.specter3d.geom.Vector2f) : void
      {
         _pointC = param1;
      }
      
      public final function get center() : org.specter3d.geom.Vector2f
      {
         if(dataCalculated == false)
         {
            calculateData();
         }
         return _center;
      }
   }
}
