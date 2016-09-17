package nslm2.modules.funnies.teamGuajiScenes.pvp.rank
{
   import game.ui.teamGuajiScenes.rank.guajiRewardListRenderUI;
   import nslm2.modules.funnies.teamGuajiScenes.vo.TeamGuajiPvPScoreRewardVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   
   public class GuajiRewardListRender extends guajiRewardListRenderUI
   {
       
      
      public var _data:TeamGuajiPvPScoreRewardVo;
      
      private var eff:BmcSpriteSheet;
      
      public function GuajiRewardListRender()
      {
         super();
         btn_got.clickHandler = getReward;
         img_got.visible = false;
         txt_haveGot.visible = false;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as TeamGuajiPvPScoreRewardVo;
         if(_data)
         {
            txt_score.text = _data.needCnt + "";
            rwdList.repeatX = _data.rewards.length;
            rwdList.dataSource = _data.rewards;
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
                  btn_got.visible = false;
                  img_got.visible = true;
            }
         }
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
         TeamGuajiService.ins.requestGetScoreReward(_data.stcVo.id,getRewardSuccessHandler);
      }
      
      private function getRewardSuccessHandler() : void
      {
         this.btn_got.visible = false;
         img_got.visible = true;
         TweenLite.from(img_got,0.2,{"scale":2});
         showBtnEff(false);
         _data.status = 2;
         FloatUtil.showGetItemsDisplayPanel(_data.rewards);
         TeamGuajiModel.ins.hasGotSocreRewardIDArr.push(_data.stcVo.id);
         TeamGuajiModel.ins.updateScoreRewardStatus();
      }
   }
}
