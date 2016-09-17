package nslm2.modules.funnies.groupon.view.rank
{
   import game.ui.groupon.rank.GrouponRewardListRenderUI;
   import proto.StaticTuanGouRewardModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.funnies.groupon.service.GrouponService;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.funnies.groupon.model.GrouponModel;
   import nslm2.utils.WealthUtil;
   
   public class GrouponRewardListRender extends GrouponRewardListRenderUI
   {
       
      
      public var _data:StaticTuanGouRewardModel;
      
      private var eff:BmcSpriteSheet;
      
      private var oriX:int;
      
      public function GrouponRewardListRender()
      {
         super();
         btn_got.clickHandler = getReward;
         img_got.visible = false;
         txt_haveGot.visible = false;
         oriX = rwdList.x;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as StaticTuanGouRewardModel;
         if(_data)
         {
            txt_score.text = _data.needScore + "";
            rwdList.repeatX = rewards.length;
            rwdList.dataSource = rewards;
            rwdList.x = oriX + (50 - rwdList.width) * 0.5;
            img_got.visible = false;
            btn_got.visible = true;
            switch(int(_data.status))
            {
               case 0:
                  btn_got.disabled = true;
                  showBtnEff(false);
                  break;
               case 1:
                  btn_got.disabled = false;
                  showBtnEff(true);
                  break;
               case 2:
                  showBtnEff(false);
                  btn_got.visible = false;
                  img_got.visible = true;
            }
         }
         .super.dataSource = param1;
      }
      
      private function showBtnEff(param1:Boolean) : void
      {
         if(param1)
         {
            if(!eff)
            {
               eff = new BmcSpriteSheet();
               eff.init(115002,1,"all",true);
               eff.x = btn_got.x - 8;
               eff.y = btn_got.y - 10;
               addChild(eff);
            }
         }
         else if(eff)
         {
            eff.dispose();
            eff = null;
         }
      }
      
      private function getReward() : void
      {
         GrouponService.ins.getScoreReward(_data.id,getRewardSuccessHandler);
      }
      
      private function getRewardSuccessHandler() : void
      {
         this.btn_got.visible = false;
         img_got.visible = true;
         TweenLite.from(img_got,0.2,{"scale":2});
         showBtnEff(false);
         _data.status = 2;
         FloatUtil.showGetItemsDisplayPanel(rewards);
         GrouponModel.ins.hasGotSocreRewardIDArr.push(_data.id);
         GrouponModel.ins.updateScoreRewardStatus();
      }
      
      private function get rewards() : Array
      {
         return WealthUtil.costStrToArr(_data.reward);
      }
   }
}
