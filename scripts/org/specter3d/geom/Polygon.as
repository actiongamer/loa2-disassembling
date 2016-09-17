package org.specter3d.geom
{
   import flash.geom.Rectangle;
   import org.specter3d.debug.DevLog;
   import flash.display.Graphics;
   import away3d.entities.SegmentSet;
   import flash.geom.Vector3D;
   import away3d.primitives.LineSegment;
   
   public class Polygon
   {
       
      
      public var vertexNmu:int;
      
      public var vertexV:Vector.<org.specter3d.geom.Vector2f>;
      
      private var rect:Rectangle;
      
      public function Polygon(param1:int = 0, param2:Vector.<org.specter3d.geom.Vector2f> = null)
      {
         super();
         this.vertexNmu = param1;
         this.vertexV = param2;
      }
      
      public function getSaveData() : Object
      {
         if(!vertexNmu && !vertexV && !vertexV.length)
         {
            return null;
         }
         var _loc2_:Object = {};
         _loc2_["vertexNmu"] = vertexNmu;
         var _loc1_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = vertexV;
         for each(var _loc3_ in vertexV)
         {
            _loc1_.push(_loc3_.getSaveData());
         }
         _loc2_["vertexV"] = _loc1_;
         return _loc2_;
      }
      
      public function isSimplicity() : Boolean
      {
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Vector.<Line2D> = new Vector.<Line2D>();
         var _loc3_:int = vertexV.length - 1;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc1_.push(new Line2D(vertexV[_loc6_],vertexV[_loc6_ + 1]));
            _loc6_++;
         }
         _loc1_.push(new Line2D(vertexV[_loc3_],vertexV[0]));
         var _loc2_:org.specter3d.geom.Vector2f = new org.specter3d.geom.Vector2f();
         var _loc8_:int = 0;
         var _loc7_:* = _loc1_;
         for each(var _loc5_ in _loc1_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc1_.length)
            {
               if(!_loc5_.equals(_loc1_[_loc4_]))
               {
                  if(_loc5_.intersection(_loc1_[_loc4_],_loc2_) == 2)
                  {
                     if(!(_loc2_.equals(_loc5_.getPointA()) || _loc2_.equals(_loc5_.getPointB()) || _loc2_.equals(_loc1_[_loc4_].getPointA()) || _loc2_.equals(_loc1_[_loc4_].getPointB())))
                     {
                        return false;
                     }
                  }
               }
               _loc4_++;
            }
         }
         return true;
      }
      
      public function cw() : void
      {
         if(this.isCW() == false)
         {
            this.vertexV.reverse();
         }
      }
      
      public function isCW() : Boolean
      {
         var _loc8_:int = 0;
         if(vertexV == null || vertexV.length < 0)
         {
            return false;
         }
         var _loc7_:org.specter3d.geom.Vector2f = this.vertexV[0];
         var _loc1_:* = 0;
         _loc8_ = 1;
         while(_loc8_ < vertexV.length)
         {
            if(_loc7_.y > vertexV[_loc8_].y)
            {
               _loc7_ = vertexV[_loc8_];
               _loc1_ = _loc8_;
            }
            else if(_loc7_.y == vertexV[_loc8_].y)
            {
               if(_loc7_.x > vertexV[_loc8_].x)
               {
                  _loc7_ = vertexV[_loc8_];
                  _loc1_ = _loc8_;
               }
            }
            _loc8_++;
         }
         var _loc5_:int = _loc1_ - 1 >= 0?_loc1_ - 1:Number(vertexV.length - 1);
         var _loc6_:int = _loc1_ + 1 >= vertexV.length?0:Number(_loc1_ + 1);
         var _loc2_:org.specter3d.geom.Vector2f = vertexV[_loc5_];
         var _loc4_:org.specter3d.geom.Vector2f = vertexV[_loc6_];
         var _loc3_:Number = multiply(_loc2_,_loc4_,_loc7_);
         if(_loc3_ < 0)
         {
            return true;
         }
         return false;
      }
      
      private function multiply(param1:org.specter3d.geom.Vector2f, param2:org.specter3d.geom.Vector2f, param3:org.specter3d.geom.Vector2f) : Number
      {
         return (param1.x - param3.x) * (param2.y - param3.y) - (param2.x - param3.x) * (param1.y - param3.y);
      }
      
      public function rectangle() : Rectangle
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         if(vertexV == null || vertexV.length < 0)
         {
            return null;
         }
         if(rect != null)
         {
            return rect;
         }
         var _loc6_:Number = vertexV[0].x;
         var _loc4_:Number = vertexV[0].x;
         var _loc1_:Number = vertexV[0].y;
         var _loc3_:Number = vertexV[0].y;
         _loc5_ = 1;
         while(_loc5_ < vertexV.length)
         {
            _loc2_ = vertexV[_loc5_];
            if(_loc2_.x < _loc6_)
            {
               _loc6_ = _loc2_.x;
            }
            if(_loc2_.x > _loc4_)
            {
               _loc4_ = _loc2_.x;
            }
            if(_loc2_.y < _loc1_)
            {
               _loc1_ = _loc2_.y;
            }
            if(_loc2_.y > _loc3_)
            {
               _loc3_ = _loc2_.y;
            }
            _loc5_++;
         }
         rect = new Rectangle(_loc6_,_loc4_ - _loc6_,_loc1_,_loc3_ - _loc1_);
         return rect;
      }
      
      public function union(param1:Polygon) : Vector.<Polygon>
      {
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         if(rectangle().intersection(param1.rectangle()) == false)
         {
            return null;
         }
         var _loc2_:Vector.<Node> = new Vector.<Node>();
         var _loc4_:Vector.<Node> = new Vector.<Node>();
         _loc7_ = 0;
         while(_loc7_ < this.vertexV.length)
         {
            _loc3_ = new Node(this.vertexV[_loc7_],false,true);
            if(_loc7_ > 0)
            {
               _loc2_[_loc7_ - 1].next = _loc3_;
            }
            _loc2_.push(_loc3_);
            _loc7_++;
         }
         _loc6_ = 0;
         while(_loc6_ < param1.vertexV.length)
         {
            _loc3_ = new Node(param1.vertexV[_loc6_],false,false);
            if(_loc6_ > 0)
            {
               _loc4_[_loc6_ - 1].next = _loc3_;
            }
            _loc4_.push(_loc3_);
            _loc6_++;
         }
         var _loc5_:int = this.intersectPoint(_loc2_,_loc4_);
         if(_loc5_ > 0)
         {
            return linkToPolygon(_loc2_,_loc4_);
         }
         return null;
      }
      
      private function linkToPolygon(param1:Vector.<Node>, param2:Vector.<Node>) : Vector.<Polygon>
      {
         var _loc4_:* = undefined;
         DevLog.debug("engine","linkToPolygon***linkToPolygon");
         var _loc5_:Vector.<Polygon> = new Vector.<Polygon>();
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.i == true && _loc3_.p == false)
            {
               _loc4_ = new Vector.<org.specter3d.geom.Vector2f>();
               while(_loc3_ != null)
               {
                  _loc3_.p = true;
                  if(_loc3_.i == true)
                  {
                     _loc3_.other.p = true;
                     if(_loc3_.o == false)
                     {
                        if(_loc3_.isMain == true)
                        {
                           _loc3_ = _loc3_.other;
                        }
                     }
                     else if(_loc3_.isMain == false)
                     {
                        _loc3_ = _loc3_.other;
                     }
                  }
                  _loc4_.push(_loc3_.v);
                  if(_loc3_.next == null)
                  {
                     if(_loc3_.isMain)
                     {
                        _loc3_ = param1[0];
                     }
                     else
                     {
                        _loc3_ = param2[0];
                     }
                  }
                  else
                  {
                     _loc3_ = _loc3_.next;
                  }
                  if(!_loc3_.v.equals(_loc4_[0]))
                  {
                     continue;
                  }
                  break;
               }
               _loc5_.push(new Polygon(_loc4_.length,_loc4_));
            }
         }
         trace("rtV",_loc5_);
         return _loc5_;
      }
      
      private function intersectPoint(param1:Vector.<Node>, param2:Vector.<Node>) : int
      {
         var _loc8_:* = null;
         var _loc13_:* = null;
         var _loc12_:* = null;
         var _loc6_:* = null;
         var _loc10_:Boolean = false;
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc11_:Boolean = false;
         var _loc9_:Node = param1[0];
         while(_loc9_ != null)
         {
            if(_loc9_.next == null)
            {
               _loc13_ = new Line2D(_loc9_.v,param1[0].v);
            }
            else
            {
               _loc13_ = new Line2D(_loc9_.v,_loc9_.next.v);
            }
            _loc8_ = param2[0];
            _loc10_ = false;
            while(_loc8_ != null)
            {
               if(_loc8_.next == null)
               {
                  _loc12_ = new Line2D(_loc8_.v,param2[0].v);
               }
               else
               {
                  _loc12_ = new Line2D(_loc8_.v,_loc8_.next.v);
               }
               _loc6_ = new org.specter3d.geom.Vector2f();
               if(_loc13_.intersection(_loc12_,_loc6_) == 2)
               {
                  if(this.getNodeIndex(param1,_loc6_) == -1)
                  {
                     _loc7_++;
                     _loc5_ = new Node(_loc6_,true,true);
                     _loc4_ = new Node(_loc6_,true,false);
                     param1.push(_loc5_);
                     param2.push(_loc4_);
                     _loc5_.other = _loc4_;
                     _loc4_.other = _loc5_;
                     _loc5_.next = _loc9_.next;
                     _loc9_.next = _loc5_;
                     _loc4_.next = _loc8_.next;
                     _loc8_.next = _loc4_;
                     if(_loc13_.classifyPoint(_loc12_.getPointB()) == 2)
                     {
                        _loc5_.o = true;
                        _loc4_.o = true;
                     }
                     _loc10_ = true;
                     break;
                  }
               }
               _loc8_ = _loc8_.next;
            }
            if(_loc10_ == false)
            {
               _loc9_ = _loc9_.next;
            }
         }
         return _loc7_;
      }
      
      private function getNodeIndex(param1:Vector.<Node>, param2:org.specter3d.geom.Vector2f) : int
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_].v.equals(param2))
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function draw(param1:Graphics) : void
      {
         var _loc2_:int = 0;
         param1.beginFill(16711680,0.5);
         param1.moveTo(vertexV[0].x,vertexV[0].y);
         _loc2_ = 1;
         while(_loc2_ < vertexV.length)
         {
            param1.lineTo(vertexV[_loc2_].x,vertexV[_loc2_].y);
            _loc2_++;
         }
         param1.lineTo(vertexV[0].x,vertexV[0].y);
         param1.endFill();
      }
      
      public function drawTriangle(param1:SegmentSet) : void
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         _loc5_ = 0;
         while(_loc5_ < vertexV.length)
         {
            _loc2_ = new Vector3D(vertexV[_loc5_].x,0,vertexV[_loc5_].y);
            if(_loc5_ + 1 < vertexV.length)
            {
               _loc4_ = new Vector3D(vertexV[_loc5_ + 1].x,0,vertexV[_loc5_ + 1].y);
            }
            else
            {
               _loc4_ = new Vector3D(vertexV[0].x,0,vertexV[0].y);
            }
            _loc3_ = new LineSegment(_loc2_,_loc4_,16711680,16711680,2);
            param1.addSegment(_loc3_);
            _loc5_++;
         }
      }
      
      public function toString() : String
      {
         var _loc2_:int = 0;
         var _loc1_:String = "Polygon:";
         _loc2_ = 0;
         while(_loc2_ < this.vertexV.length)
         {
            _loc1_ = _loc1_ + (" -> " + vertexV[_loc2_]);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function clone() : Polygon
      {
         var _loc2_:int = 0;
         var _loc3_:int = vertexNmu;
         var _loc1_:Vector.<org.specter3d.geom.Vector2f> = new Vector.<org.specter3d.geom.Vector2f>();
         _loc2_ = 0;
         while(_loc2_ < vertexV.length)
         {
            _loc1_.push(vertexV[_loc2_].clone());
            _loc2_++;
         }
         return new Polygon(_loc3_,_loc1_);
      }
   }
}
