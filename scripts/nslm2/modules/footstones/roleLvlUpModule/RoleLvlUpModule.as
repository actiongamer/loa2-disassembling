package nslm2.modules.footstones.roleLvlUpModule
{
   import game.ui.lvlUpModules.RoleLvlUpModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.footstones.roleLvlUpModule.model.RoleLvlUpModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.globalModules.facebook.view.FBBtnView;
   import nslm2.common.globals.GlobalRef;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import nslm2.utils.PlatformUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookFeedVo;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.handlers.Handler;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import morn.core.utils.NumberUtil;
   import nslm2.modules.footstones.roleLvlUpModule.view.FunctionListRender;
   
   public class RoleLvlUpModule extends RoleLvlUpModuleUI implements INewerGuideGetComp
   {
       
      
      private var model:RoleLvlUpModel;
      
      private var bombEff:BmcSpriteSheet;
      
      private var titleBgEff:BmcSpriteSheet;
      
      private var tilteShineEff:BmcSpriteSheet;
      
      private var titleBgShineEff:BmcSpriteSheet;
      
      private var paramVo:nslm2.modules.footstones.roleLvlUpModule.RoleLvlUpModuleParam;
      
      public function RoleLvlUpModule()
      {
         model = RoleLvlUpModel.ins;
         super();
         moduleFadeInType = 0;
         btn_ok.clickHandler = closeMe;
         panelBg.btn_close.visible = false;
      }
      
      public function get fbBtnView() : FBBtnView
      {
         return this.faceBookView as FBBtnView;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.paramVo = param1 as nslm2.modules.footstones.roleLvlUpModule.RoleLvlUpModuleParam;
         list_prop.dataSource = model.propListData;
         list_function.dataSource = model.functionListData;
         GlobalRef.mainCityReshowParam.needShowPanel = false;
         this.setMouseEnabledList("ROLE_LV_MODULE",false);
         this.mouseChildren = false;
         super.preShow();
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc2_:* = null;
         super.show(param1);
         this.setMouseEnabledList("ROLE_LV_MODULE",false);
         this.mouseChildren = false;
         TweenLite.from(this.img_title,0.3,{
            "scaleX":3,
            "scaleY":3,
            "ease":Back.easeInOut
         });
         TweenLite.delayedCall(0.1,addBombEffect);
         TweenLite.delayedCall(0.8,addBgShineffect);
         TweenLite.from(this.box_bg,0.2,{
            "delay":0.6,
            "y":1000
         });
         TweenLite.from(this.list_prop,0.2,{
            "delay":0.8,
            "alpha":0,
            "x":-100
         });
         TweenLite.from(this.list_function,0.2,{
            "delay":0.9,
            "alpha":0,
            "x":100
         });
         fbBtnView.visible = false;
         if(PlatformUtil.isFeedShowFaceBook)
         {
            _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_facebook_feed",["feedType","para_1"],[3,PlayerModel.ins.level]);
            if(_loc2_)
            {
               fbBtnView.visible = true;
               fbBtnView.dataSource = {
                  "feedId":_loc2_.ID,
                  "para_1":PlayerModel.ins.level,
                  "para_2":0
               };
               btn_ok.x = 49;
               TweenLite.from(btn_ok,0.2,{
                  "delay":1,
                  "alpha":0,
                  "y":btn_ok.y + 30
               });
               TweenLite.from(fbBtnView,0.2,{
                  "delay":1,
                  "alpha":0,
                  "y":fbBtnView.y + 30
               });
            }
            else
            {
               btn_ok.x = this.width - btn_ok.width >> 1;
               TweenLite.from(btn_ok,0.2,{
                  "delay":1,
                  "alpha":0,
                  "y":btn_ok.y + 30
               });
            }
         }
         else
         {
            btn_ok.x = this.width - btn_ok.width >> 1;
            TweenLite.from(btn_ok,0.2,{
               "delay":1,
               "alpha":0,
               "y":btn_ok.y + 30
            });
         }
         TweenLite.delayedCall(1.3,ngCheck);
      }
      
      private function ngCheck() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.mouseChildren = true;
         this.setMouseEnabledList("ROLE_LV_MODULE",true);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      private function addBombEffect() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         img_titleBg.visible = true;
         bombEff = new BmcSpriteSheet();
         bombEff.init(1015004);
         DisplayUtils.addChildBelow(bombEff,this.img_title);
         bombEff.scaleX = 1.5;
         bombEff.scaleY = 1.5;
         bombEff.x = -50;
         bombEff.y = -160;
      }
      
      private function addBgShineffect() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         titleBgShineEff = new BmcSpriteSheet();
         titleBgShineEff.init(1015002,1,"all",true);
         titleBgShineEff.y = -114;
         titleBgShineEff.x = 8;
         DisplayUtils.addChildBelow(titleBgShineEff,img_titleBg);
      }
      
      private function closeMe() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         btnCloseHandler();
         if(paramVo)
         {
            Handler.execute(paramVo.handler);
         }
         else if(NGUtil.isCurFuncId(40400) && ModuleMgr.ins.isShow(40400) == false)
         {
            ModuleMgr.ins.showModule(40400);
         }
         else
         {
            _loc1_ = model.functionListData.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               if((model.functionListData[_loc2_] as StcFunctionVo).level != PlayerModel.ins.level)
               {
                  _loc2_++;
                  continue;
               }
               break;
            }
         }
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         if(NumberUtil.isNumber(param1))
         {
            _loc4_ = this.list_function.cells.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = this.list_function.cells[_loc5_] as FunctionListRender;
               if(_loc3_ && _loc3_.stcFunctionVo && _loc3_.stcFunctionVo.id == int(param1))
               {
                  return _loc3_;
               }
               _loc5_++;
            }
            return null;
         }
         return NGUtil.getCompById(this,param1,param2);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
         this.setMouseEnabledList("ROLE_LV_MODULE",false);
         this.mouseChildren = false;
         NGUtil.levelUpWinClose(PlayerModel.ins.level);
      }
   }
}
