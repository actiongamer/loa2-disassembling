package nslm2.modules.funnies.guildPKCrossSer
{
   import game.ui.guildPKCrossSer.GuildWinnerShowUI;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.FamilyExpeChampionThroneReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.funnies.pkCrossSer.PKCrossComp.WinnerUIUnit3D;
   import proto.FamilyExpeChampionThroneRes;
   import proto.PlayerBaseInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import com.greensock.TweenLite;
   import away3d.cameras.lenses.OrthographicLens;
   
   public class GPKWinnerShowModule extends GuildWinnerShowUI
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
      
      public function GPKWinnerShowModule()
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         super();
         var _loc1_:Object = AppGlobalContext.stage3d.camera3d;
         (_loc1_.lens as OrthographicLens).projectionHeight = 900;
         avatars = [];
         _loc3_ = 0;
         while(_loc3_ < 5)
         {
            _loc2_ = new WinnerUIUnit3D(null,0);
            avatars.push(_loc2_);
            _loc2_.x = GPKConst.pos_winner_show[_loc3_].x;
            _loc2_.y = GPKConst.pos_winner_show[_loc3_].y;
            _loc2_.box3D2.scaleAll = GPKConst.pos_winner_show[_loc3_].scale;
            this.layer3D.addChild(_loc2_);
            _loc3_++;
         }
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
         AppGlobalContext.asynLoader.loadOne(new ResourceVo("img/gpk_winner_bg.png"),img_bg_loadCpl);
      }
      
      private function img_bg_loadCpl() : void
      {
         img_bg3d = new Image3D("img/gpk_winner_bg.png",0,0,1000,false,true);
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
            _loc1_ = new FamilyExpeChampionThroneReq();
            _loc1_.caNum = caNum;
            ServerEngine.ins.send(4368,_loc1_,onPKCrossDateRet);
         }
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
      
      private function onPKCrossDateRet(param1:FamilyExpeChampionThroneRes) : void
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1.infos;
         for each(var _loc3_ in param1.infos)
         {
            if(!Uint64Util.equal(_loc3_.id,param1.leader.id))
            {
               _loc2_.push(_loc3_);
            }
         }
         if(param1.leader)
         {
            _loc2_.unshift(param1.leader);
         }
         if(_loc2_.length > 5)
         {
            _loc2_ = _loc2_.slice(0,5);
         }
         timeStamp = param1.startStamp;
         caNum = param1.caNum;
         maxNum = param1.latestCaNum;
         chgAvatarShow(_loc2_);
         updateView(param1);
      }
      
      private function updateView(param1:FamilyExpeChampionThroneRes) : void
      {
         titleTxt.text = LocaleMgr.ins.getStr(999900122,[caNum]);
         this.txt_time.text = "";
         if(timeStamp <= 0)
         {
            this.txt_date.text = "";
         }
         else
         {
            this.txt_date.text = TextFieldUtil.htmlText2(TimeUtils.getShortTimeStr(timeStamp),11137387);
         }
         if(param1.leader)
         {
            this.txt_time.text = GPKConst.getDistStr(param1.leader.opName,param1.leader.dist,param1.leader.familyName) + "\n" + LocaleMgr.ins.getStr(31013) + "：" + TextFieldUtil.htmlText2(param1.leader.name,11137387);
         }
         this.pageBarUI.btn_next.disabled = caNum >= maxNum;
         this.pageBarUI.btn_prev.disabled = caNum <= 1;
      }
      
      private function chgAvatarShow(param1:Array) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         super.moduleServerStart(null);
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
