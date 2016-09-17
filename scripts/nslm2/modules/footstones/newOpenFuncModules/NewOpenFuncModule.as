package nslm2.modules.footstones.newOpenFuncModules
{
   import game.ui.newOpenFuncModules.NewOpenFuncModuleUI;
   import com.mz.core.components.comp2d.BlackRim;
   import com.mz.core.configs.ClientConfig;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Button;
   import nslm2.common.uiEffects.IconFlyEff;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   
   public class NewOpenFuncModule extends NewOpenFuncModuleUI
   {
       
      
      private var _funcId:int;
      
      public function NewOpenFuncModule()
      {
         super();
         this.centerX = 0;
         this.centerY = 0;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc3_:BlackRim = new BlackRim();
         this.addChildAt(_loc3_,0);
         _loc3_.width = ClientConfig.SCENE_FIXED_W;
         _loc3_.height = ClientConfig.SCENE_FIXED_H;
         _loc3_.hole = null;
         _loc3_.fileAlpha = 0.6;
         _loc3_.x = (this.width - _loc3_.width) / 2;
         _loc3_.y = (this.height - _loc3_.height) / 2;
         _loc3_.draw();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         _funcId = param1 as int;
         this.txt_funcName.text = LocaleMgr.ins.getStr(9000000 + _funcId) + "开启";
         var _loc2_:StcFunctionVo = StcMgr.ins.getFunctionVo(_funcId);
         if(_loc2_)
         {
            this.txt_desc.text = LocaleMgr.ins.getStr(_loc2_.total_desc);
         }
         else
         {
            this.txt_desc.text = "";
         }
         this.img_func.skin = UrlLib.funcIcon(_funcId);
         this.preShowCpl();
      }
      
      public function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = param1;
         if(this.btn_confirm === _loc3_)
         {
            _loc2_ = NewOpenFuncUtils.getFunIcon(_funcId);
            if(_loc2_)
            {
               new IconFlyEff(IconFlyEff.copyImage(this.img_func),this.img_func,_loc2_).exec();
            }
            ModuleMgr.ins.closeModule(96700);
            NGUtil.checkOtherModuleShow();
         }
      }
   }
}
