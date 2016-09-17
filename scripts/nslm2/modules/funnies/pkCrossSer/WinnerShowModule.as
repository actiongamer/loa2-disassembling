package nslm2.modules.funnies.pkCrossSer
{
   import game.ui.pkCrossSer.WinnerShowUI;
   import nslm2.modules.funnies.pkCrossSer.PKCrossComp.WinnerUIUnit3D;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.CrossArenaHonorHallReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CrossArenaHonorHallRes;
   import proto.CrossArenaHonorPlayerInfo;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.RTools;
   import proto.PlayerBaseInfo;
   import com.greensock.TweenLite;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcCountryIconVo;
   import morn.core.components.Image;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import away3d.cameras.lenses.OrthographicLens;
   
   public class WinnerShowModule extends WinnerShowUI
   {
      
      public static const KIND_PK_CROSS:int = 0;
       
      
      private var avatar0:WinnerUIUnit3D;
      
      private var avatar1:WinnerUIUnit3D;
      
      private var avatar2:WinnerUIUnit3D;
      
      private var kind:int = 0;
      
      private var caNum:int = 0;
      
      private var maxNum:int = 0;
      
      private var timeStamp:uint;
      
      private var img_bg3d:Image3D;
      
      private var fromLeft:Boolean = true;
      
      private var flags:Array;
      
      public function WinnerShowModule()
      {
         flags = [];
         super();
         var _loc1_:Object = AppGlobalContext.stage3d.camera3d;
         (_loc1_.lens as OrthographicLens).projectionHeight = 900;
         avatar0 = new WinnerUIUnit3D(null,1);
         avatar1 = new WinnerUIUnit3D(null,2);
         avatar2 = new WinnerUIUnit3D(null,3);
         this.layer3D.addChild(avatar0);
         this.layer3D.addChild(avatar1);
         this.layer3D.addChild(avatar2);
         avatar0.y = -180;
         avatar1.x = -224;
         avatar2.x = 224;
         avatar1.y = -130;
         avatar2.y = -130;
         avatar0.box3D2.scaleAll = 1.2;
         avatar1.box3D2.scaleAll = 0.9;
         avatar2.box3D2.scaleAll = 0.9;
         this.moduleFadeInType = 0;
         this.pageBarUI.btn_next.clickHandler = nexClick;
         this.pageBarUI.btn_prev.clickHandler = prevClick;
      }
      
      private function prevClick() : void
      {
         caNum = Number(caNum) - 1;
         fromLeft = false;
         reqSerData();
      }
      
      private function nexClick() : void
      {
         caNum = Number(caNum) + 1;
         fromLeft = true;
         reqSerData();
      }
      
      public function get layer3D() : ObjectContainer3D
      {
         return AppGlobalContext.stage3d.view3d2Layer3D;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         btn_close.clickHandler = closeHandler;
         this.kind = param1 as int;
         AppGlobalContext.asynLoader.loadOne(new ResourceVo("img/winner_show_bg.png"),img_bg_loadCpl);
      }
      
      private function img_bg_loadCpl() : void
      {
         img_bg3d = new Image3D("img/winner_show_bg.png",0,0,1000,false,true);
         this.layer3D.addChild(img_bg3d);
         AppGlobalContext.stage3d.view3d2.mouseChildren = true;
         AppGlobalContext.stage3d.view3d2.mouseEnabled = true;
         ModuleMgr.ins.staticLayer.switchVisible("PK_CROSS",false);
         ModuleMgr.ins.sceneLayer.switchVisible("PK_CROSS",false);
         super.preShow();
         reqSerData();
      }
      
      private function closeHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      private function reqSerData() : void
      {
         var _loc1_:* = null;
         setAllAvatarVisible(false);
         if(!int(kind))
         {
            _loc1_ = new CrossArenaHonorHallReq();
            _loc1_.caNum = caNum;
            ServerEngine.ins.send(4323,_loc1_,onPKCrossDateRet);
         }
      }
      
      private function setAllAvatarVisible(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < 3)
         {
            _loc2_ = this["avatar" + _loc3_];
            _loc2_.visible = param1;
            _loc3_++;
         }
      }
      
      private function onPKCrossDateRet(param1:CrossArenaHonorHallRes) : void
      {
         var _loc2_:Array = [];
         param1.infos.sortOn("rank");
         var _loc5_:int = 0;
         var _loc4_:* = param1.infos;
         for each(var _loc3_ in param1.infos)
         {
            _loc2_.push(_loc3_);
         }
         timeStamp = param1.startStamp;
         caNum = param1.caNum;
         maxNum = param1.latestCaNum;
         chgAvatarShow(_loc2_);
         updateView();
      }
      
      private function updateView() : void
      {
         img_jie.value = caNum;
         if(timeStamp <= 0)
         {
            this.txt_time.text = "";
         }
         else
         {
            this.txt_time.text = TimeUtils.getFullTimeStrCN(timeStamp,true,true,RTools.cl(false,true)).split(" ")[0];
         }
         this.pageBarUI.btn_next.disabled = caNum >= maxNum;
         this.pageBarUI.btn_prev.disabled = caNum <= 1;
      }
      
      private function chgAvatarShow(param1:Array) : void
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:Number = NaN;
         super.moduleServerStart(null);
         removeFlag();
         if(param1.length <= 0)
         {
            this.txt_noData.visible = true;
            return;
         }
         this.txt_noData.visible = false;
         _loc6_ = 0;
         while(_loc6_ < param1.length)
         {
            if(param1[_loc6_] is CrossArenaHonorPlayerInfo)
            {
               _loc3_ = param1[_loc6_];
               _loc5_ = _loc3_.baseInfo;
               addFlag(_loc3_.country,_loc6_);
            }
            else
            {
               _loc5_ = param1[_loc6_];
            }
            _loc4_ = this["avatar" + _loc6_];
            _loc4_.visible = true;
            _loc2_ = !!fromLeft?_loc4_.x - 100:Number(_loc4_.x + 100);
            TweenLite.from(_loc4_,0.5,{"x":_loc2_});
            _loc4_.chgView(_loc5_);
            _loc6_++;
         }
      }
      
      private function removeFlag() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < flags.length)
         {
            this.removeChild(flags[_loc1_]);
            _loc1_++;
         }
         flags = [];
      }
      
      private function addFlag(param1:uint, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:Number = NaN;
         if(param1 > 0)
         {
            _loc3_ = StcMgr.ins.getCountryIconVo(param1);
            if(_loc3_)
            {
               _loc5_ = new Image(UrlLib.olmpicCountryFlagUrl(_loc3_.icon));
               _loc5_.width = 42;
               _loc5_.height = 26;
               switch(int(param2))
               {
                  case 0:
                     _loc5_.x = 455;
                     _loc5_.y = 195;
                     break;
                  case 1:
                     _loc5_.x = 232;
                     _loc5_.y = 210;
                     break;
                  case 2:
                     _loc5_.x = 685;
                     _loc5_.y = 210;
               }
               _loc4_ = !!fromLeft?_loc5_.x - 100:Number(_loc5_.x + 100);
               TweenLite.from(_loc5_,0.5,{"x":_loc4_});
               this.addChild(_loc5_);
               flags.push(_loc5_);
            }
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.switchVisible("PK_CROSS",true);
         ModuleMgr.ins.sceneLayer.switchVisible("PK_CROSS",true);
         if(avatar0)
         {
            avatar0.dispose();
         }
         if(avatar1)
         {
            avatar1.dispose();
         }
         if(avatar2)
         {
            avatar2.dispose();
         }
         if(img_bg3d)
         {
            img_bg3d.dispose();
         }
         AppGlobalContext.stage3d.view3d2.mouseChildren = false;
         AppGlobalContext.stage3d.view3d2.mouseEnabled = false;
         super.preClose(param1);
      }
   }
}
