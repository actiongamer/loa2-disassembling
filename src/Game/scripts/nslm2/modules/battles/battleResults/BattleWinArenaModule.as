package nslm2.modules.battles.battleResults
{
   import game.ui.battleResults.BattleWinArenaModuleUI;
   import flash.display.Shape;
   import nslm2.utils.PlayerVoUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.arenas.ArenaConsts;
   import nslm2.modules.funnies.arenas.ArenaChallengeResultVo;
   import com.mz.core.configs.ClientConfig;
   import com.greensock.TweenLite;
   import com.mz.core.utils2.ShakeUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.fightPlayer.UnitVo;
   
   public class BattleWinArenaModule extends BattleWinArenaModuleUI
   {
       
      
      protected var _whiteBg:Shape;
      
      protected var _battleWinArenaVo:nslm2.modules.battles.battleResults.BattleWinArenaVo;
      
      private var _exitTime:int = 15;
      
      public function BattleWinArenaModule()
      {
         super();
         this.moduleFadeInType = 0;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         _battleWinArenaVo = param1 as nslm2.modules.battles.battleResults.BattleWinArenaVo;
         this.list_winTeam.dataSource = PlayerVoUtils.unitVoArrToVoArr(_battleWinArenaVo.selfTeamArr);
         this.list_lossTeam.dataSource = PlayerVoUtils.unitVoArrToVoArr(_battleWinArenaVo.enemyTeamArr);
         this.txt_winName.text = LocaleMgr.ins.getStr(999000026) + getMajorName(_battleWinArenaVo.selfTeamArr);
         this.txt_lossName.text = LocaleMgr.ins.getStr(999000026) + getMajorName(_battleWinArenaVo.enemyTeamArr);
         var _loc2_:ArenaChallengeResultVo = ArenaConsts.ins.ARENA_CHALLENGE_RESULT_VO;
         if(_loc2_)
         {
            if(_loc2_.upedRank > 0)
            {
               var _loc3_:* = _loc2_.upedRank.toString();
               this.txt_downRank.text = _loc3_;
               this.txt_upedRank.text = _loc3_;
               this.txt_winRank.text = LocaleMgr.ins.getStr(999000027) + _loc2_.challengeRank;
               this.txt_lossRank.text = LocaleMgr.ins.getStr(999000027) + (int(_loc2_.challengeRank) + int(_loc2_.upedRank));
               this.box_rankDown.x = this.txt_lossRank.x + this.txt_lossRank.textWidth;
               this.box_rankUp.x = this.txt_winRank.x + this.txt_winRank.textWidth;
            }
            else
            {
               this.txt_winRank.text = LocaleMgr.ins.getStr(999000027) + (int(_loc2_.challengeRank) + int(_loc2_.upedRank));
               this.txt_lossRank.text = LocaleMgr.ins.getStr(999000027) + _loc2_.challengeRank;
               _loc3_ = false;
               this.box_rankUp.visible = _loc3_;
               this.box_rankDown.visible = _loc3_;
            }
         }
         else
         {
            _loc3_ = false;
            this.box_rankUp.visible = _loc3_;
            this.box_rankDown.visible = _loc3_;
            this.txt_winRank.text = LocaleMgr.ins.getStr(999000028) + getMajorLevel(_battleWinArenaVo.selfTeamArr);
            this.txt_lossRank.text = LocaleMgr.ins.getStr(999000028) + getMajorLevel(_battleWinArenaVo.enemyTeamArr);
         }
         _whiteBg = new Shape();
         _whiteBg.graphics.beginFill(16777215,1);
         _whiteBg.alpha = 0.1;
         _whiteBg.graphics.drawRect(-this.x,-this.y,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         addChild(_whiteBg);
         _loc3_ = 2;
         this.img_winLogo.scaleY = _loc3_;
         this.img_winLogo.scaleX = _loc3_;
         TweenLite.to(this.img_winLogo,0.4,{
            "scaleX":1,
            "scaleY":1
         });
         this.box_btns.dataSource = new BattleResultConfigVo(_battleWinArenaVo.closeHandler,_battleWinArenaVo.replayHandler,_battleWinArenaVo.statisticHandler);
         this.preShowCpl();
      }
      
      private function showLogo() : void
      {
      }
      
      override public function fadeIn(param1:Number = 0, param2:int = 0) : void
      {
         super.fadeIn(param1,param2);
         TweenLite.to(this._whiteBg,0.3,{
            "alpha":0.5,
            "onComplete":whiteBgDisappear
         });
      }
      
      private function shakeBg() : void
      {
         ShakeUtil.shake(true,this.img_winBg,3,5,5,50);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      private function whiteBgDisappear() : void
      {
         DisplayUtils.removeSelf(_whiteBg);
      }
      
      protected function getMajorName(param1:Array) : String
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(_loc2_.isMajor == true)
            {
               return _loc2_.name;
            }
         }
         return null;
      }
      
      private function getMajorLevel(param1:Array) : int
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(_loc2_.isMajor == true)
            {
               return _loc2_.serVo.level;
            }
         }
         return 0;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
