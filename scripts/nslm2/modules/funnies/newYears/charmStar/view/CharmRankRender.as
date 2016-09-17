package nslm2.modules.funnies.newYears.charmStar.view
{
   import game.ui.newYears.charmStar.render.CharmRankRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.newYears.charmStar.model.CharmStarRankVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.funnies.pkCrossSer.PKCrossConst;
   import nslm2.common.vo.PlayerVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.utils.ObjectUtils;
   
   public class CharmRankRender extends CharmRankRenderUI implements IObserver
   {
       
      
      public function CharmRankRender()
      {
         super();
         init();
         switchEventListener(true);
      }
      
      private function init() : void
      {
         this.txt_tip1.text = LocaleMgr.ins.getStr(13323007);
      }
      
      public function get vo() : CharmStarRankVo
      {
         return this.dataSource as CharmStarRankVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1;
         if(vo)
         {
            _loc2_ = WealthUtil.costStrToArr(vo.rankVo.jibenjiangli).concat(WealthUtil.costStrToArr(vo.rankVo.chaojijiangli));
            this.list_reward.repeatX = _loc2_.length;
            this.list_reward.centerX = 0;
            this.list_reward.dataSource = _loc2_;
            if(vo.rank <= 3)
            {
               this.img_rank.visible = true;
               this.clip.visible = false;
               this.img_rank.skin = "png.uiCharmStar.rank" + vo.rank;
            }
            else
            {
               this.img_rank.visible = false;
               this.clip.visible = true;
               this.clip.value = vo.rank;
            }
            if(vo.rankInfo)
            {
               this.label_name.text = LinkUtils.playerNameSmart(vo.rankInfo.info.id,vo.rankInfo.info.name,vo.rankInfo.info.dist,ColorLib.getMilitaryColor(this.vo.rankInfo.info.militaryRank));
               this.label_pop.text = vo.rankInfo.popularity + "";
               _loc3_ = PKCrossConst.RankInfoToPlayerVo(vo.rankInfo.info);
               if(_loc3_)
               {
                  this.renderHero.dataSource = PKCrossConst.RankInfoToPlayerVo(vo.rankInfo.info);
                  this.renderHero.ref_img_icon.smoothing = true;
                  this.renderHero.ref_list_tupo.visible = false;
                  this.renderHero.ref_txt_lv.visible = false;
                  this.renderHero.visible = true;
               }
               else
               {
                  this.renderHero.visible = false;
               }
            }
            else
            {
               this.label_name.text = "";
               this.label_pop.text = "--";
               this.renderHero.visible = false;
            }
            this.btn_send.clickHandler = clickSend;
         }
         onSendBtn(NpcFuncService.ins.isOpenTime(13402));
      }
      
      private function clickSend() : void
      {
         if(NpcFuncService.ins.isOpenTime(13403) == false || NpcFuncService.ins.isOpenTime(13402) == false)
         {
            AlertUtil.floadFuncTimeIsExpire(13400);
            return;
         }
         if(vo.rankInfo)
         {
            if(FriendService.ins.isFriend(vo.rankInfo.info.id) == false && Uint64Util.equal(vo.rankInfo.info.id,PlayerModel.ins.playerInfo.id) == false)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(999003119));
               return;
            }
            ModuleMgr.ins.showModule(13406,vo.rankInfo.info.id,ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            ModuleMgr.ins.showModule(13405,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function switchEventListener(param1:Boolean) : void
      {
         ObserverMgr.ins.regObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["RANK_TIME_OVER"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("RANK_TIME_OVER" === _loc3_)
         {
            onSendBtn(false);
         }
      }
      
      private function onSendBtn(param1:Boolean) : void
      {
         if(param1)
         {
            ObjectUtils.gray(btn_send,false);
            btn_send.toolTip = null;
         }
         else
         {
            ObjectUtils.gray(btn_send,true);
            btn_send.toolTip = LocaleMgr.ins.getStr(999003116);
         }
      }
      
      override public function dispose() : void
      {
         switchEventListener(false);
         super.dispose();
      }
   }
}
