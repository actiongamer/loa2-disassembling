package nslm2.modules.footstones.moduleBases
{
   import com.mz.core.interFace.IObserver;
   import com.mz.core.components.comp2d.BlackRim;
   import flash.geom.Rectangle;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.geom.Point;
   import flash.events.Event;
   import com.mz.core.mgrs.UIMgr;
   
   public class StaticModuleLayer extends ModuleLayerBase implements IObserver
   {
       
      
      public var maskHole:BlackRim;
      
      public function StaticModuleLayer()
      {
         super();
         ObserverMgr.ins.regObserver(this);
      }
      
      override protected function createModuleInfo(param1:int) : ModuleInfoVo
      {
         var _loc3_:ModuleInfoVo = super.createModuleInfo(param1);
         var _loc2_:ModuleConfigVo = ModuleMgr.ins.getConfigVo(param1);
         if(_loc2_.disposeWhenCloseProxy == 1)
         {
            _loc3_.disposeWhenClose = true;
         }
         else
         {
            _loc3_.disposeWhenClose = false;
         }
         return _loc3_;
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_POP_MODULE_HOLE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("MSG_POP_MODULE_HOLE" === _loc4_)
         {
            _loc3_ = param2 as Rectangle;
            hitHole3D(_loc3_);
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      protected function hitHole3D(param1:Rectangle) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(param1)
         {
            _loc3_ = this.parent.globalToLocal(new Point(param1.x,param1.y));
            _loc2_ = new Rectangle(_loc3_.x,_loc3_.y,param1.width,param1.height);
            maskHole.hole = _loc2_;
            maskHole.draw();
            maskHole.cacheAsBitmap = true;
            this.cacheAsBitmap = true;
            this.mask = maskHole;
         }
         else
         {
            this.cacheAsBitmap = false;
            this.mask = null;
            maskHole.visible = false;
         }
      }
      
      override protected function onResize(param1:Event) : void
      {
         super.onResize(param1);
         this.maskHole.width = UIMgr.gameWidth;
         this.maskHole.height = UIMgr.gameHeight;
      }
   }
}
