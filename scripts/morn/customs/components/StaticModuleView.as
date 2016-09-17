package morn.customs.components
{
   import flash.geom.Rectangle;
   import flash.geom.Point;
   
   public class StaticModuleView extends ModuleViewBase
   {
       
      
      public function StaticModuleView()
      {
         super();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_POP_MODULE_HOLE"]);
      }
      
      protected function get bounds() : Rectangle
      {
         return this.getRect(this.parent);
      }
      
      protected function hitHole3D(param1:Rectangle) : Boolean
      {
         var _loc4_:Point = this.parent.globalToLocal(new Point(param1.x,param1.y));
         var _loc3_:Rectangle = new Rectangle(_loc4_.x,_loc4_.y,param1.width,param1.height);
         var _loc2_:Rectangle = this.bounds;
         return _loc3_.intersects(_loc2_);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("MSG_POP_MODULE_HOLE" !== _loc4_)
         {
            return;
         }
      }
   }
}
