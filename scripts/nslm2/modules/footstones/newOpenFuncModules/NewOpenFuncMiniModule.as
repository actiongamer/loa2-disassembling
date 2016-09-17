package nslm2.modules.footstones.newOpenFuncModules
{
   import game.ui.newOpenFuncModules.NewOpenFuncMiniModuleUI;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import com.greensock.TweenLite;
   
   public class NewOpenFuncMiniModule extends NewOpenFuncMiniModuleUI
   {
       
      
      private var _isShowing:Boolean = true;
      
      public function NewOpenFuncMiniModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.top = 150;
         refresh();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.txt_des.visible = false;
         this.preShowCpl();
      }
      
      public function refresh() : void
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:* = null;
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_function","is_show",1);
         _loc3_.sortOn("level",16);
         var _loc2_:int = _loc3_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc2_)
         {
            _loc5_ = PlayerModel.ins.level;
            _loc1_ = _loc3_[_loc6_];
            if(_loc1_.level > _loc5_)
            {
               _loc4_ = _loc1_;
               break;
            }
            _loc6_++;
         }
         if(_loc4_)
         {
            this.visible = true;
            this.img_func.skin = UrlLib.funcIcon(_loc4_.id);
            this.txt_funcName.text = LocaleMgr.ins.getStr(9000000 + _loc4_.id);
            this.txt_openLevel.text = LocaleMgr.ins.getStr(30100044,[_loc4_.level]);
         }
         else
         {
            this.visible = false;
         }
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("PLAYER_LEVEL_UP" === _loc3_)
         {
            refresh();
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("PLAYER_LEVEL_UP");
      }
      
      public function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_zoom === _loc2_)
         {
            zoomInfoPanel();
         }
      }
      
      public function zoomInfoPanel() : void
      {
         if(_isShowing)
         {
            TweenLite.to(box_info,0.2,{"x":-box_info.width});
            this.txt_des.visible = true;
         }
         else
         {
            TweenLite.to(box_info,0.2,{"x":0});
            this.txt_des.visible = false;
         }
         _isShowing = !_isShowing;
      }
   }
}
