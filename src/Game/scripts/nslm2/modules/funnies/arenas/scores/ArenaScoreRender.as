package nslm2.modules.funnies.arenas.scores
{
   import game.ui.arenas.scores.ArenaScoreRenderUI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.mgrs.stcMgrs.vos.StcSwapActionVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.funnies.arenas.ArenaService;
   import morn.core.utils.ObjectUtils;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import flash.events.MouseEvent;
   import proto.SwapActionReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.events.Event;
   
   public class ArenaScoreRender extends ArenaScoreRenderUI
   {
       
      
      private var btnEff:BmcSpriteSheet;
      
      public function ArenaScoreRender()
      {
         super();
         this.btn_get.addEventListener("click",btn_getHandler);
      }
      
      public function get vo() : ArenaScoreVo
      {
         return this.dataSource as ArenaScoreVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(this.vo)
         {
            _loc2_ = this.vo.stcVo;
            if(_loc2_)
            {
               this.image_line.visible = true;
               this.txt_tip.visible = false;
               this.list_reward.visible = true;
               this.num_label.toolTip = LocaleMgr.ins.getStr(999000402,[_loc2_.condition1count]);
               this.num_label.text = String(_loc2_.condition1count);
               this.list_reward.array = WealthUtil.dropGroupIDToWealthVoArr(_loc2_.drop_id);
               if(this.vo.count < _loc2_.limit_count)
               {
                  if(PlayerModel.ins.level >= _loc2_.conditionLevel)
                  {
                     if(ArenaService.ins.infoRes.scores >= _loc2_.condition1count)
                     {
                        this.btn_get.label = LocaleMgr.ins.getStr(999000240);
                        this.btn_get.disabled = false;
                        this.btn_get.visible = true;
                        this.have_got.visible = false;
                        this.image_line.disabled = false;
                        this.image_icon.disabled = false;
                        ObjectUtils.gray(this.num_label,false);
                     }
                     else
                     {
                        this.btn_get.label = LocaleMgr.ins.getStr(50200403);
                        this.btn_get.disabled = true;
                        this.btn_get.visible = true;
                        this.have_got.visible = false;
                        this.image_line.disabled = true;
                        this.image_icon.disabled = true;
                        ObjectUtils.gray(this.num_label,true);
                     }
                  }
                  else
                  {
                     this.btn_get.label = LocaleMgr.ins.getStr(999000403) + LocaleConsts.lvStr(_loc2_.conditionLevel);
                     this.btn_get.disabled = true;
                     this.btn_get.visible = true;
                     this.have_got.visible = false;
                     this.image_line.disabled = true;
                     this.image_icon.disabled = true;
                     ObjectUtils.gray(this.num_label,true);
                  }
               }
               else
               {
                  this.have_got.visible = true;
                  this.btn_get.visible = false;
                  this.image_line.disabled = false;
                  this.image_icon.disabled = false;
                  ObjectUtils.gray(this.num_label,false);
               }
            }
            else
            {
               this.num_label.toolTip = "";
               this.image_line.visible = false;
               this.image_icon.disabled = false;
               ObjectUtils.gray(this.num_label,false);
               this.list_reward.visible = false;
               this.txt_tip.visible = true;
               this.num_label.text = "0";
               this.btn_get.visible = false;
               this.have_got.visible = false;
            }
         }
         showOrHideBtnEffect();
      }
      
      protected function showOrHideBtnEffect() : void
      {
         if(this.btn_get.disabled == false && this.btn_get.visible == true)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(10000002,1,"all",true);
               btnEff.x = btn_get.x - 3;
               btnEff.y = btn_get.y - 3;
               this.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      private function btn_getHandler(param1:MouseEvent) : void
      {
         this.server_swapAction(this.vo.sid);
      }
      
      public function server_swapAction(param1:int) : void
      {
         var _loc2_:SwapActionReq = new SwapActionReq();
         _loc2_.id = param1;
         ServerEngine.ins.send(8008,_loc2_,server_swapAction_cpl);
      }
      
      public function oneKeyCollectCpl() : void
      {
         this.vo.info.count++;
         ArenaService.ins.checkScoreCanGet();
         this.dataSource = this.vo;
      }
      
      protected function server_swapAction_cpl() : void
      {
         this.vo.info.count++;
         ArenaService.ins.checkScoreCanGet();
         FloatUtil.showGetItemsDisplayPanel(this.list_reward.array);
         this.dataSource = this.vo;
         ArenaService.ins.dispatchEvent(new Event("ArenaService.EVT_UPDATE_ONE_CLICK"));
      }
   }
}
