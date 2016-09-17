package morn.customs.expands
{
   public class SkinConfigVo
   {
       
      
      public var skin:String;
      
      public var offsetX:int;
      
      public var offsetY:int;
      
      public function SkinConfigVo(param1:String)
      {
         super();
         this.skin = param1;
      }
      
      public function set_offsetX(param1:int) : SkinConfigVo
      {
         this.offsetX = param1;
         return this;
      }
      
      public function set_offsetY(param1:int) : SkinConfigVo
      {
         this.offsetY = param1;
         return this;
      }
   }
}
