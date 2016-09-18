package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldRank.render.BattlefieldTabRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.battles.battlefields.consts.BattlefieldConsts;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   
   public class BattlefieldTabRender extends BattlefieldTabRenderUI
   {
       
      
      private var _redPoint:RedPoint;
      
      public function BattlefieldTabRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            switchEventListeners(true);
            this.img_bg.skin = "png.a5.commonImgs.rank.bgs.unselected.img_unselectedBg" + this.dataSource;
            this.img_icon.skin = "png.a5.commonImgs.rank.icons.img_icon" + this.dataSource;
            this.img_selectedBg.skin = "png.a5.commonImgs.rank.bgs.selected.img_selectedBg" + this.dataSource;
            this.txt_rankName.text = LocaleMgr.ins.getStr(BattlefieldConsts.RANK_NAME[int(this.dataSource) - 1]);
            onRewardCpl(null);
         }
         else
         {
            switchEventListeners(false);
         }
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            BattlefieldMsgs.ins.addEventListener("msgBattlefieldDegreeRankRewardCpl",onRewardCpl);
         }
         else
         {
            BattlefieldMsgs.ins.removeEventListener("msgBattlefieldDegreeRankRewardCpl",onRewardCpl);
         }
      }
      
      private function onRewardCpl(param1:MzEvent) : void
      {
         if(dataSource == 1)
         {
            if(BattlefieldModel.ins.canGetSeasonReward)
            {
               if(_redPoint == null)
               {
                  _redPoint = new RedPoint();
                  _redPoint.top = -2;
                  _redPoint.right = -2;
                  this.addChild(_redPoint);
               }
            }
            else if(_redPoint)
            {
               _redPoint.dispose();
               _redPoint = null;
            }
         }
      }
   }
}
