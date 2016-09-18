package org.specter3d.geom
{
   public class Line2D
   {
       
      
      public var pointA:org.specter3d.geom.Vector2f;
      
      public var pointB:org.specter3d.geom.Vector2f;
      
      private var m_Normal:org.specter3d.geom.Vector2f;
      
      private var m_NormalCalculated:Boolean = false;
      
      public function Line2D(param1:org.specter3d.geom.Vector2f = null, param2:org.specter3d.geom.Vector2f = null)
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
         m_NormalCalculated = false;
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
         return _loc1_;
      }
      
      public function setPointA(param1:org.specter3d.geom.Vector2f) : void
      {
         this.pointA = param1.clone();
         m_NormalCalculated = false;
      }
      
      public function setPointB(param1:org.specter3d.geom.Vector2f) : void
      {
         this.pointB = param1.clone();
         m_NormalCalculated = false;
      }
      
      private function setPoints(param1:org.specter3d.geom.Vector2f, param2:org.specter3d.geom.Vector2f) : void
      {
         this.pointA = param1.clone();
         this.pointB = param2.clone();
         m_NormalCalculated = false;
      }
      
      private function getNormal() : org.specter3d.geom.Vector2f
      {
         if(!m_NormalCalculated)
         {
            computeNormal();
         }
         return m_Normal;
      }
      
      public function signedDistance(param1:org.specter3d.geom.Vector2f) : Number
      {
         if(!m_NormalCalculated)
         {
            computeNormal();
         }
         var _loc2_:org.specter3d.geom.Vector2f = param1.subtract(pointA);
         return _loc2_.dot(m_Normal);
      }
      
      public function signedDistanceQuick(param1:org.specter3d.geom.Vector2f) : Number
      {
         if(!m_NormalCalculated)
         {
            computeNormal();
         }
         return (param1.x - pointA.x) * m_Normal.x + (param1.y - pointA.y) * m_Normal.y;
      }
      
      public function classifyPoint(param1:org.specter3d.geom.Vector2f, param2:Number = 1.0E-6) : int
      {
         var _loc3_:int = 0;
         var _loc4_:Number = signedDistance(param1);
         if(_loc4_ > param2)
         {
            _loc3_ = 2;
         }
         else if(_loc4_ < -param2)
         {
            _loc3_ = 1;
         }
         return _loc3_;
      }
      
      public function classifyPointQuick(param1:org.specter3d.geom.Vector2f, param2:Number = 1.0E-6) : int
      {
         var _loc3_:int = 0;
         if(!m_NormalCalculated)
         {
            computeNormal();
         }
         var _loc4_:Number = (param1.x - pointA.x) * m_Normal.x + (param1.y - pointA.y) * m_Normal.y;
         if(_loc4_ > param2)
         {
            _loc3_ = 2;
         }
         else if(_loc4_ < -param2)
         {
            _loc3_ = 1;
         }
         return _loc3_;
      }
      
      public function intersection(param1:Line2D, param2:org.specter3d.geom.Vector2f = null) : int
      {
         var _loc7_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc3_:Number = (param1.pointB.y - param1.pointA.y) * (this.pointB.x - this.pointA.x) - (param1.pointB.x - param1.pointA.x) * (this.pointB.y - this.pointA.y);
         var _loc4_:Number = (param1.pointB.x - param1.pointA.x) * (this.pointA.y - param1.pointA.y) - (param1.pointB.y - param1.pointA.y) * (this.pointA.x - param1.pointA.x);
         var _loc5_:Number = (param1.pointA.x - this.pointA.x) * (this.pointB.y - this.pointA.y) - (param1.pointA.y - this.pointA.y) * (this.pointB.x - this.pointA.x);
         if(_loc3_ == 0)
         {
            if(_loc4_ == 0 && _loc5_ == 0)
            {
               return 0;
            }
            return 5;
         }
         _loc4_ = _loc4_ / _loc3_;
         _loc5_ = _loc5_ / _loc3_;
         _loc7_ = this.pointA.x + _loc4_ * (this.pointB.x - this.pointA.x);
         _loc6_ = this.pointA.y + _loc4_ * (this.pointB.y - this.pointA.y);
         if(param2 != null)
         {
            param2.x = _loc7_;
            param2.y = _loc6_;
         }
         if(_loc4_ >= 0 && _loc4_ <= 1 && _loc5_ >= 0 && _loc5_ <= 1)
         {
            return 2;
         }
         if(_loc5_ >= 0 && _loc5_ <= 1)
         {
            return 3;
         }
         if(_loc4_ >= 0 && _loc4_ <= 1)
         {
            return 4;
         }
         return 1;
      }
      
      public function getPointA() : org.specter3d.geom.Vector2f
      {
         return pointA;
      }
      
      public function getPointB() : org.specter3d.geom.Vector2f
      {
         return pointB;
      }
      
      public function length() : Number
      {
         var _loc1_:Number = pointB.x - pointA.x;
         var _loc2_:Number = pointB.y - pointA.y;
         _loc1_ = _loc1_ * _loc1_;
         _loc2_ = _loc2_ * _loc2_;
         return Number(Math.sqrt(_loc1_ + _loc2_));
      }
      
      public function getDirection() : org.specter3d.geom.Vector2f
      {
         var _loc1_:org.specter3d.geom.Vector2f = pointB.subtract(pointA);
         return _loc1_.normalizeLocal();
      }
      
      private function computeNormal() : void
      {
         m_Normal = getDirection();
         var _loc1_:Number = m_Normal.y;
         m_Normal.y = m_Normal.x;
         m_Normal.x = -_loc1_;
         m_NormalCalculated = true;
      }
      
      public function equals(param1:Line2D) : Boolean
      {
         return pointA.equals(param1.getPointA()) && pointB.equals(param1.getPointB()) || pointA.equals(param1.getPointB()) && pointB.equals(param1.getPointA());
      }
      
      public function clone() : Line2D
      {
         return new Line2D(pointA.clone(),pointB.clone());
      }
      
      public function toString() : String
      {
         return "Line:" + pointA + " -> " + pointB;
      }
   }
}
