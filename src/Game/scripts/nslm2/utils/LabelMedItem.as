package nslm2.utils
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.Label;
   import morn.core.components.Component;
   import flash.geom.Rectangle;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import com.mz.core.configs.EnvConfig;
   
   public class LabelMedItem implements IDispose
   {
       
      
      public var lab:Label;
      
      public var charIndex:int;
      
      public var comp:Component;
      
      public function LabelMedItem(param1:Label, param2:int, param3:Component)
      {
         super();
         this.lab = param1;
         this.charIndex = param2;
         this.comp = param3;
         comp.addEventListener("click",comp_onClick);
      }
      
      public function checkAndShow() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(lab.stage)
         {
            _loc3_ = lab.textField.height;
            lab.textField.height = lab.textField.textHeight;
            lab.textField.height = _loc3_;
            _loc1_ = lab.textField.getCharBoundaries(charIndex);
            if(_loc1_ == null)
            {
               _loc1_ = new Rectangle();
            }
            _loc2_ = lab.getRect(lab.parent);
            lab.addChild(comp);
            comp.x = _loc1_.x + lab.textField.x;
            comp.y = _loc1_.y + lab.textField.y + (_loc1_.height - comp.height) / 2;
            lab.labelMedItemList.push();
         }
         else
         {
            lab.addEventListener("addedToStage",lab_addToStage);
         }
      }
      
      private function lab_addToStage(param1:Event) : void
      {
         lab.removeEventListener("addedToStage",lab_addToStage);
         checkAndShow();
      }
      
      private function comp_onClick(param1:MouseEvent) : void
      {
         if(EnvConfig.ins.showDevModule && param1.altKey)
         {
            this.checkAndShow();
         }
      }
      
      public function dispose() : void
      {
         this.comp.dispose();
         this.lab.removeEventListener("addedToStage",lab_addToStage);
      }
   }
}
