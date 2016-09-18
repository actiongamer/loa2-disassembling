package nslm2.modules.foundations.guildModule.view.panel.shardDonate
{
   import game.ui.guildModules.guildShardDonate.ShardDonateRenderUI;
   import proto.FamilyHeroDonateCase;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.utils.ServerTimer;
   import nslm2.utils.TimeUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.model.PlayerModel;
   import flash.events.MouseEvent;
   import proto.FamilyHeroDonationDonateReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyHeroDonationDonateRes;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.AlertUtil;
   import com.greensock.TweenLite;
   import nslm2.utils.WealthUtil;
   
   public class ShardDonateRender extends ShardDonateRenderUI
   {
       
      
      private var _isSelf:Boolean;
      
      public function ShardDonateRender(param1:FamilyHeroDonateCase)
      {
         var _loc3_:int = 0;
         super();
         this.dataSource = param1;
         list_wealth.array = [WealthUtil.createItemVo(vo.itemId,1)];
         btn_donate.toolTip = LocaleMgr.ins.getStr(350010040);
         if(PlayerModel.ins.isCurPlayer(vo.userId))
         {
            isSelf = true;
            txtReqName.text = LocaleMgr.ins.getStr(999004000);
            btn_donate.visible = false;
            txtReqName1.text = LocaleMgr.ins.getStr(350010039);
         }
         else
         {
            isSelf = false;
            txtReqName.text = vo.userName;
            btn_donate.visible = true;
            this.btn_donate.addEventListener("click",onBtnClick);
            txtReqName1.text = LocaleMgr.ins.getStr(999004001);
         }
         txtReqName1.x = txtReqName.x + txtReqName.width + 5;
         this.txtOwnNum.text = LocaleMgr.ins.getStr(999004002) + BagModel.ins.getStcCount(vo.itemId).toString();
         this.txtProgress.text = vo.nowNum.toString() + "/" + vo.maxNum.toString();
         progressBar.value = vo.nowNum / vo.maxNum;
         var _loc2_:Number = ServerTimer.ins.second - vo.stamp;
         this.txtCD1.text = LocaleMgr.ins.getStr(999004004,[TimeUtils.oneCN(_loc2_)]);
         this.txtCD2.text = LocaleMgr.ins.getStr(999004005,[TimeUtils.oneCN(Number(vo.stamp + int(StcMgr.ins.getDefineVo("FAMILY_DONATE_MAX_TIME").define_value) - ServerTimer.ins.second))]);
         _loc3_ = 0;
         while(_loc3_ < vo.donateUser.length)
         {
            try
            {
               if(PlayerModel.ins.isCurPlayer(vo.donateUser[_loc3_]))
               {
                  btn_donate.disabled = true;
               }
            }
            catch(e:Error)
            {
            }
            _loc3_++;
         }
         if(BagModel.ins.getStcCount(vo.itemId) == 0)
         {
            btn_donate.disabled = true;
         }
      }
      
      public function updateInfo(param1:FamilyHeroDonateCase) : void
      {
         var _loc3_:int = 0;
         this.dataSource = param1;
         this.txtOwnNum.text = LocaleMgr.ins.getStr(999004002) + BagModel.ins.getStcCount(vo.itemId).toString();
         this.txtProgress.text = vo.nowNum.toString() + "/" + vo.maxNum.toString();
         progressBar.value = vo.nowNum / vo.maxNum;
         var _loc2_:Number = ServerTimer.ins.second - vo.stamp;
         this.txtCD1.text = LocaleMgr.ins.getStr(999004004,[TimeUtils.oneCN(_loc2_)]);
         this.txtCD2.text = LocaleMgr.ins.getStr(999004005,[TimeUtils.oneCN(Number(vo.stamp + int(StcMgr.ins.getDefineVo("FAMILY_DONATE_MAX_TIME").define_value) - ServerTimer.ins.second))]);
         _loc3_ = 0;
         while(_loc3_ < vo.donateUser.length)
         {
            try
            {
               if(PlayerModel.ins.isCurPlayer(vo.donateUser[_loc3_]))
               {
                  btn_donate.disabled = true;
               }
            }
            catch(e:Error)
            {
            }
            _loc3_++;
         }
         if(BagModel.ins.getStcCount(vo.itemId) == 0)
         {
            btn_donate.disabled = true;
         }
      }
      
      public function get vo() : FamilyHeroDonateCase
      {
         return this.dataSource as FamilyHeroDonateCase;
      }
      
      public function set isSelf(param1:Boolean) : void
      {
         this._isSelf = param1;
         this.x = !!this._isSelf?110:10;
         this.bg_other.visible = !this._isSelf;
         this.bg_self.visible = this.isSelf;
      }
      
      public function onBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:FamilyHeroDonationDonateReq = new FamilyHeroDonationDonateReq();
         _loc2_.id = vo.id;
         ServerEngine.ins.send(10022,_loc2_,onHeroShardDonateResult);
      }
      
      private function onHeroShardDonateResult(param1:FamilyHeroDonationDonateRes) : void
      {
         GuildModel.ins.panelRes.list = param1.list;
         GuildModel.ins.panelRes.ply = param1.ply;
         ObserverMgr.ins.sendNotice("GUILD_NOTICE_UPDATE_HERO_SHARD_PANEL");
         AlertUtil.float(LocaleMgr.ins.getStr(999004012));
      }
      
      public function get isSelf() : Boolean
      {
         return this._isSelf;
      }
      
      public function fadeOut() : void
      {
         TweenLite.to(this,0.3,{
            "x":-20,
            "alpha":0,
            "onComplete":onFadeOutComplete
         });
      }
      
      public function onFadeOutComplete() : void
      {
         this.visible = false;
      }
   }
}
