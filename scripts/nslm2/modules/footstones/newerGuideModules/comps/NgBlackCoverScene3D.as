package nslm2.modules.footstones.newerGuideModules.comps
{
   import morn.customs.components.GRect;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.configs.ClientConfig;
   
   public class NgBlackCoverScene3D extends GRect
   {
      
      private static var _ins:nslm2.modules.footstones.newerGuideModules.comps.NgBlackCoverScene3D;
       
      
      public function NgBlackCoverScene3D()
      {
         super();
         this.width = ClientConfig.SCENE_FIXED_W;
         this.height = ClientConfig.SCENE_FIXED_H;
         this.fillColor = 0;
         this.fillAlpha = 0.37;
      }
      
      public static function get ins() : nslm2.modules.footstones.newerGuideModules.comps.NgBlackCoverScene3D
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.footstones.newerGuideModules.comps.NgBlackCoverScene3D();
         }
         return _ins;
      }
      
      public function switchState(param1:Boolean) : void
      {
         if(param1)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      public function show() : void
      {
         ModuleMgr.ins.sceneLayer.curMiv.module.addChildAt(this,0);
      }
      
      public function hide() : void
      {
         DisplayUtils.removeSelf(this);
      }
   }
}
