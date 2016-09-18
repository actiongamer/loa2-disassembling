package com.junkbyte.console.vos
{
   import flash.utils.ByteArray;
   import com.junkbyte.console.core.Executer;
   
   public class GraphInterest
   {
       
      
      private var _ref:com.junkbyte.console.vos.WeakRef;
      
      public var _prop:String;
      
      private var useExec:Boolean;
      
      public var key:String;
      
      public var col:Number;
      
      public var v:Number;
      
      public var avg:Number;
      
      public function GraphInterest(param1:String = "", param2:Number = 0)
      {
         super();
         this.col = param2;
         this.key = param1;
      }
      
      public static function FromBytes(param1:ByteArray) : GraphInterest
      {
         var _loc2_:GraphInterest = new GraphInterest(param1.readUTF(),param1.readUnsignedInt());
         _loc2_.v = param1.readDouble();
         _loc2_.avg = param1.readDouble();
         return _loc2_;
      }
      
      public function setObject(param1:Object, param2:String) : Number
      {
         this._ref = new com.junkbyte.console.vos.WeakRef(param1);
         this._prop = param2;
         this.useExec = this._prop.search(/[^\w\d]/) >= 0;
         this.v = this.getCurrentValue();
         this.avg = this.v;
         return this.v;
      }
      
      public function get obj() : Object
      {
         return this._ref != null?this._ref.reference:undefined;
      }
      
      public function get prop() : String
      {
         return this._prop;
      }
      
      public function getCurrentValue() : Number
      {
         return !!this.useExec?Number(Executer.Exec(this.obj,this._prop)):Number(this.obj[this._prop]);
      }
      
      public function setValue(param1:Number, param2:uint = 0) : void
      {
         this.v = param1;
         if(param2 > 0)
         {
            if(isNaN(this.avg))
            {
               this.avg = this.v;
            }
            else
            {
               this.avg = this.avg + (this.v - this.avg) / param2;
            }
         }
      }
      
      public function toBytes() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeUTF(this.key);
         _loc1_.writeUnsignedInt(this.col);
         _loc1_.writeDouble(this.v);
         _loc1_.writeDouble(this.avg);
         return _loc1_;
      }
   }
}
