package nslm2.modules.funnies.teamPKCS
{
   import game.ui.teamPKCS.TPKCWinnerShowUI;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.funnies.pkCrossSer.PKCrossComp.WinnerUIUnit3D;
   import proto.CteamArenaHonorRes;
   import proto.CteamArenaHonorRes.team;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import proto.PlayerBaseInfo;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   import com.greensock.TweenLite;
   
   public class TPKWinnerShowModule extends TPKCWinnerShowUI
   {
      
      public static const KIND_GPK:int = 0;
      
      private static const avatar_num:int = 5;
       
      
      private var avatars:Array;
      
      private var kind:int = 0;
      
      private var caNum:int = 0;
      
      private var maxNum:int = 0;
      
      private var timeStamp:uint;
      
      private var img_bg3d:Image3D;
      
      private var fromLeft:Boolean = true;
      
      private var _res:CteamArenaHonorRes;
      
      public function TPKWinnerShowModule()
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         super();
         AppGlobalContext.stage3d.resetProjectionHeight();
         avatars = [];
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc1_ = new WinnerUIUnit3D(null,0);
            avatars.push(_loc1_);
            _loc1_.x = GPKConst.pos_winner_show[_loc2_].x;
            _loc1_.y = GPKConst.pos_winner_show[_loc2_].y;
            _loc1_.box3D2.scaleAll = GPKConst.pos_winner_show[_loc2_].scale;
            this.layer3D.addChild(_loc1_);
            _loc2_++;
         }
         this.moduleFadeInType = 0;
         this.pageBarUI.btn_next.clickHandler = nexClick;
         this.pageBarUI.btn_prev.clickHandler = prevClick;
         this.txt_date.text = "";
         this.txt_time.text = "";
         this.txt_noData.text = LocaleMgr.ins.getStr(50800110);
         this.pageBarUI.btn_next.disabled = true;
         this.pageBarUI.btn_prev.disabled = true;
         titleTxt.text = LocaleMgr.ins.getStr(999900217,[1]);
      }
      
      private function prevClick() : void
      {
         caNum = Number(caNum) - 1;
         fromLeft = false;
         updateView(_res.info[caNum - 1]);
      }
      
      private function nexClick() : void
      {
         caNum = Number(caNum) + 1;
         fromLeft = true;
         updateView(_res.info[caNum - 1]);
      }
      
      public function get layer3D() : ObjectContainer3D
      {
         return AppGlobalContext.stage3d.view3d2Layer3D;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         btn_close.clickHandler = closeHandler;
         this.kind = param1 as int;
         AppGlobalContext.asynLoader.loadOne(new ResourceVo("img/tpk_winner_bg.png"),img_bg_loadCpl);
      }
      
      private function img_bg_loadCpl() : void
      {
         img_bg3d = new Image3D("img/tpk_winner_bg.png",0,0,1000,false,true);
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
         setAllAvatarVisible(false);
         ServerEngine.ins.send(5417,null,onPKCrossDateRet);
      }
      
      private function setAllAvatarVisible(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < 5)
         {
            _loc2_ = avatars[_loc3_];
            _loc2_.visible = param1;
            _loc3_++;
         }
      }
      
      private function onPKCrossDateRet(param1:CteamArenaHonorRes) : void
      {
         _res = param1;
         super.moduleServerStart(null);
         if(param1 == null)
         {
            caNum = 0;
            maxNum = 0;
            this.txt_noData.visible = true;
            return;
         }
         caNum = param1.info.length;
         maxNum = param1.info.length;
         updateView(_res.info[caNum - 1]);
      }
      
      private function updateView(param1:team) : void
      {
         titleTxt.text = LocaleMgr.ins.getStr(999900217,[caNum]);
         this.txt_time.text = "";
         timeStamp = param1.time;
         if(timeStamp <= 0)
         {
            this.txt_date.text = "";
         }
         else
         {
            this.txt_date.text = TextFieldUtil.htmlText2(TimeUtils.getShortTimeStr(timeStamp),11137387);
         }
         var _loc2_:PlayerBaseInfo = param1.info[0];
         if(_loc2_)
         {
            this.txt_time.text = GPKConst.getDistStr(_loc2_.opName,_loc2_.dist,param1.name) + "\n" + LocaleMgr.ins.getStr(50800048) + "：" + TextFieldUtil.htmlText2(_loc2_.name,11137387);
         }
         chgAvatarShow(param1.info);
         this.pageBarUI.btn_next.disabled = caNum >= maxNum;
         this.pageBarUI.btn_prev.disabled = caNum <= 1;
      }
      
      private function chgAvatarShow(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         if(param1.length <= 0)
         {
            this.txt_noData.visible = true;
            return;
         }
         this.txt_noData.visible = false;
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = param1[_loc5_];
            _loc3_ = avatars[_loc5_];
            _loc3_.visible = true;
            _loc2_ = !!fromLeft?_loc3_.x - 100:Number(_loc3_.x + 100);
            TweenLite.from(_loc3_,0.5,{"x":_loc2_});
            _loc3_.chgView(_loc4_);
            _loc5_++;
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         ModuleMgr.ins.staticLayer.switchVisible("PK_CROSS",true);
         ModuleMgr.ins.sceneLayer.switchVisible("PK_CROSS",true);
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            avatars[_loc2_].dispose();
            _loc2_++;
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
