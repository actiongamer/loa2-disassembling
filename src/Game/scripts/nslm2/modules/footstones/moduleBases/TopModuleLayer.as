package nslm2.modules.footstones.moduleBases
{
   import flash.display.Sprite;
   import com.mz.core.configs.ClientConfig;
   import flash.display.DisplayObject;
   import morn.customs.components.ModuleViewBase;
   import com.mz.core.utils.DisplayUtils;
   
   public class TopModuleLayer extends ModuleLayerBase
   {
       
      
      private var conver:Sprite;
      
      public function TopModuleLayer()
      {
         super();
         conver = new Sprite();
         drawCover();
         conver.visible = false;
         this.addChild(this.conver);
      }
      
      private function drawCover() : void
      {
         conver.graphics.clear();
         conver.graphics.beginFill(0,0.2);
         conver.graphics.drawRect(0,0,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         conver.graphics.endFill();
      }
      
      override protected function layout() : void
      {
         super.layout();
         this.validateCover();
      }
      
      override public function showModule(param1:uint, param2:Object = null, param3:int = 0, param4:* = null) : ModuleInfoVo
      {
         var _loc5_:ModuleConfigVo = ModuleMgr.ins.getConfigVo(param1);
         if(_loc5_.useCoverKind == 1)
         {
            drawCover();
            this.addChild(this.conver);
            this.conver.visible = true;
         }
         return super.showModule(param1,param2,param3,param4);
      }
      
      private function validateCover() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:uint = this.numChildren;
         _loc4_ = _loc3_ - 1;
         while(_loc4_ >= 0)
         {
            _loc1_ = this.getChildAt(_loc4_);
            if(_loc1_ is ModuleViewBase)
            {
               _loc2_ = this.getModuleInfo((_loc1_ as ModuleViewBase).moduleId);
               if(_loc2_ && _loc2_.isShow)
               {
                  if(_loc2_.configVo.useCoverKind == 1)
                  {
                     this.conver.visible = true;
                     DisplayUtils.addChildBelow(this.conver,_loc2_.module);
                     return;
                  }
               }
            }
            _loc4_--;
         }
         this.conver.visible = false;
      }
   }
}
