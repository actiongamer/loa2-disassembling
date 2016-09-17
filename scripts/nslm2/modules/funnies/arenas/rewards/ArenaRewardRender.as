package nslm2.modules.funnies.arenas.rewards
{
   import game.ui.arenas.rewards.ArenaRewardRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import com.mz.core.configs.ClientConfig;
   
   public class ArenaRewardRender extends ArenaRewardRenderUI
   {
       
      
      private var _rankVo:StcRankVo;
      
      private var _haveGotReward:Boolean = false;
      
      private var _yesterdayRank:int;
      
      public function ArenaRewardRender()
      {
         super();
         this.img_selectBox.mouseEvent = false;
      }
      
      public function get rankVo() : StcRankVo
      {
         return _rankVo;
      }
      
      public function set rankVo(param1:StcRankVo) : void
      {
         _rankVo = param1;
         if(this.rankVo)
         {
            this.img_icon.skin = SkinLib.changeSkinNum(this.img_icon.skin,Math.min(5,this.listCellVo.dataIndex + 1));
            if(rankVo.rankMin == 1)
            {
               this.txt_rank.text = LocaleMgr.ins.getStr(50400602,[rankVo.rankMin]);
            }
            else if(rankVo.rankMax >= 999999)
            {
               this.txt_rank.text = LocaleMgr.ins.getStr(999000401);
            }
            else if(rankVo.rankMin == rankVo.rankMax)
            {
               if(rankVo.rankMin == 0)
               {
                  this.txt_rank.text = LocaleMgr.ins.getStr(50500120);
               }
               else
               {
                  this.txt_rank.text = String(rankVo.rankMin);
               }
            }
            else
            {
               this.txt_rank.text = rankVo.rankMin + "-" + rankVo.rankMax;
            }
            this.list_reward.array = WealthUtil.costStrToArr(rankVo.jibenjiangli);
            validateRank();
         }
      }
      
      public function set haveGotReward(param1:Boolean) : void
      {
         _haveGotReward = param1;
      }
      
      public function get haveGotReward() : Boolean
      {
         return _haveGotReward;
      }
      
      public function set yesterdayRank(param1:int) : void
      {
         _yesterdayRank = param1;
         validateRank();
      }
      
      private function validateRank() : void
      {
         this.img_selectBox.visible = false;
         if(_yesterdayRank && this.rankVo)
         {
            this.img_selectBox.visible = this.rankVo.checkRank(_yesterdayRank);
            if(ClientConfig.isRuLang())
            {
               this.img_get.y = 4;
               var _loc1_:* = 0.8;
               this.img_get.scaleY = _loc1_;
               this.img_get.scaleX = _loc1_;
               this.img_get.smoothing = true;
            }
            if(this.img_selectBox.visible && this.haveGotReward)
            {
               this.img_get.visible = true;
            }
            else
            {
               this.img_get.visible = false;
            }
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 is StcRankVo)
         {
            this.rankVo = param1 as StcRankVo;
         }
      }
   }
}
