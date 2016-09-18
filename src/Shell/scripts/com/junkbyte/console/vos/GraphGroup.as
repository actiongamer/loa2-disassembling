package com.junkbyte.console.vos
{
   import flash.utils.ByteArray;
   import flash.geom.Rectangle;
   
   public class GraphGroup
   {
      
      public static const FPS:uint = 1;
      
      public static const MEM:uint = 2;
       
      
      public var type:uint;
      
      public var name:String;
      
      public var freq:int = 1;
      
      public var low:Number;
      
      public var hi:Number;
      
      public var fixed:Boolean;
      
      public var averaging:uint;
      
      public var inv:Boolean;
      
      public var interests:Array;
      
      public var rect:Rectangle;
      
      public var idle:int;
      
      public function GraphGroup(param1:String)
      {
         this.interests = [];
         super();
         this.name = param1;
      }
      
      public static function FromBytes(param1:ByteArray) : GraphGroup
      {
         var _loc2_:GraphGroup = new GraphGroup(param1.readUTF());
         _loc2_.type = param1.readUnsignedInt();
         _loc2_.idle = param1.readUnsignedInt();
         _loc2_.low = param1.readDouble();
         _loc2_.hi = param1.readDouble();
         _loc2_.inv = param1.readBoolean();
         var _loc3_:ByteArray = param1.readObject();
         _loc3_.position = 0;
         while(_loc3_.bytesAvailable)
         {
            _loc2_.interests.push(GraphInterest.FromBytes(_loc3_));
         }
         return _loc2_;
      }
      
      public function updateMinMax(param1:Number) : void
      {
         if(!isNaN(param1) && !this.fixed)
         {
            if(isNaN(this.low))
            {
               this.low = param1;
               this.hi = param1;
            }
            if(param1 > this.hi)
            {
               this.hi = param1;
            }
            if(param1 < this.low)
            {
               this.low = param1;
            }
         }
      }
      
      public function toBytes() : ByteArray
      {
         var _loc3_:GraphInterest = null;
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeUTF(this.name);
         _loc1_.writeUnsignedInt(this.type);
         _loc1_.writeUnsignedInt(this.idle);
         _loc1_.writeDouble(this.low);
         _loc1_.writeDouble(this.hi);
         _loc1_.writeBoolean(this.inv);
         var _loc2_:ByteArray = new ByteArray();
         for each(_loc3_ in this.interests)
         {
            _loc2_.writeBytes(_loc3_.toBytes());
         }
         _loc1_.writeObject(_loc2_);
         return _loc1_;
      }
   }
}
