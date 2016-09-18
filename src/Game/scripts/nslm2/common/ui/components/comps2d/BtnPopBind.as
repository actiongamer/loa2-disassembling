package nslm2.common.ui.components.comps2d
{
   import com.mz.core.interFace.IDispose;
   import flash.display.InteractiveObject;
   import flash.display.DisplayObject;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.MouseEvent;
   
   public class BtnPopBind implements IDispose
   {
       
      
      public var btn:InteractiveObject;
      
      public var pop:DisplayObject;
      
      public function BtnPopBind(param1:InteractiveObject, param2:DisplayObject)
      {
         super();
         this.btn = param1;
         this.pop = param2;
      }
      
      public function switchPop() : Boolean
      {
         if(this.pop.visible)
         {
            pop.visible = false;
            UIMgr.stage.removeEventListener("click",stageClickHdr);
            return false;
         }
         UIMgr.stage.addEventListener("click",stageClickHdr);
         pop.visible = true;
         return true;
      }
      
      private function stageClickHdr(param1:MouseEvent) : void
      {
         if(param1.target != this.btn)
         {
            pop.visible = false;
            UIMgr.stage.removeEventListener("click",stageClickHdr);
         }
      }
      
      public function dispose() : void
      {
         this.btn = null;
         this.pop = null;
         UIMgr.stage.removeEventListener("click",stageClickHdr);
      }
   }
}
