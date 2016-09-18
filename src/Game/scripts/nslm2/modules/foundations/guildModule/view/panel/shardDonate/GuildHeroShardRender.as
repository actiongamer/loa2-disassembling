package nslm2.modules.foundations.guildModule.view.panel.shardDonate
{
   import game.ui.guildModules.guildShardDonate.GuildHeroShardRenderUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import proto.FamilyHeroDonationLaunchReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyHeroDonationLaunchRes;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.core.managers.timerMgrs.TimerManager;
   import morn.core.handlers.Handler;
   import flash.events.Event;
   import morn.customs.FilterLib;
   import proto.Item;
   import com.mz.core.mediators.RollMediator;
   
   public class GuildHeroShardRender extends GuildHeroShardRenderUI implements IObserver
   {
       
      
      public function GuildHeroShardRender()
      {
         super();
         this.parts.push(new RollMediator(this,onRoll));
         this.buttonMode = true;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.wealthVo == null)
         {
            this.removeEventListener("click",btn_handler);
            this.box1.visible = false;
         }
         else
         {
            this.addEventListener("click",btn_handler);
            ObserverMgr.ins.regObserver(this);
            this.box1.visible = true;
         }
      }
      
      override protected function validateImgIcon() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            _loc2_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
            _loc1_ = UrlLib.npcDialogIcon(_loc2_.head_id);
            ResMgr.ins.load(1,_loc1_,loadIconUrlCpl);
            this.img_icon.url = _loc1_;
         }
      }
      
      private function loadIconUrlCpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.img_mask.cacheAsBitmap = true;
         this.img_icon.cacheAsBitmap = true;
         this.img_icon.mask = this.img_mask;
         showPieceTip(UrlLib.piece_tip_big(),39,44);
         var _loc1_:int = 6;
         icon_pieceTip.right = _loc1_;
         icon_pieceTip.top = _loc1_;
      }
      
      override protected function validateTxtName() : void
      {
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            _loc1_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
            this.ref_txt_name.color = ColorLib.qualityColor(_loc1_.quality);
            this.ref_txt_name.text = LocaleMgr.ins.getStr(_loc1_.name);
            this.ref_txt_name.visible = true;
            if(false && _loc1_.career_id)
            {
               this.img_career.url = UrlLib.npcTypeIcon(_loc1_.career_id);
               this.img_career.visible = true;
            }
            else
            {
               this.img_career.visible = false;
            }
         }
      }
      
      override protected function validateQuality() : void
      {
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            _loc1_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
            this.ref_img_quality.url = UrlLib.npcPieceQualityBg(_loc1_.quality);
            ref_img_quality.visible = true;
            this.img_bg.visible = false;
         }
         else
         {
            this.img_bg.visible = true;
            ref_img_quality.visible = false;
         }
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         if(param1 < wealthVo.stcItemVo.heroPieceNeed)
         {
            this.ref_txt_num.color = 16723968;
         }
         else
         {
            this.ref_txt_num.color = 458496;
         }
         this.ref_txt_num.visible = true;
         this.ref_txt_num.text = LocaleMgr.ins.getStr(999000045) + param1 + "/" + wealthVo.stcItemVo.heroPieceNeed;
      }
      
      private function btn_handler(param1:MouseEvent) : void
      {
         AlertUtil.comfirm(LocaleMgr.ins.getStr(350010041),onDoConfrim);
      }
      
      private function onDoConfrim() : void
      {
         var _loc1_:FamilyHeroDonationLaunchReq = new FamilyHeroDonationLaunchReq();
         _loc1_.itemId = wealthVo.stcItemVo.id;
         ServerEngine.ins.send(10021,_loc1_,onFamilyHeroDonationLaunchHandler);
      }
      
      private function onFamilyHeroDonationLaunchHandler(param1:FamilyHeroDonationLaunchRes) : void
      {
         GuildModel.ins.panelRes.list = param1.list;
         GuildModel.ins.panelRes.ply = param1.ply;
         ObserverMgr.ins.sendNotice("GUILD_NOTICE_UPDATE_HERO_SHARD_PANEL");
         ModuleMgr.ins.closeModule(1000001);
      }
      
      private function btn_getPoint_handler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_PIECE_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function successHandler() : void
      {
         TimerManager.ins.doOnce(200,new Handler(this.dispatchEvent,[new Event("evtNewHero",true)]));
      }
      
      private function onRoll(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(this.wealthVoIsEnable)
         {
            if(param1)
            {
               _loc2_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
               this.filters = [FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_loc2_.quality))];
            }
            else
            {
               this.filters = null;
            }
         }
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("msg_item_num_change" === _loc4_)
         {
            _loc3_ = param2 as Item;
            if(this.wealthVo.kind == 20 && this.wealthVo.sid == _loc3_.itemId)
            {
               this.validateTxtNum();
               this.validateTxtName();
            }
         }
      }
      
      override protected function validateIconMask() : void
      {
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["msg_item_num_change"]);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
