package nslm2.modules.battles.PeakSports.view.renders
{
   import game.ui.peakSports.peakSportsFightResult.render.PeakSportsFightResultHeroRenderUI;
   import proto.BattlePlayer;
   import nslm2.modules.battles.PeakSports.model.vos.PeakSportsFightHeroVo;
   import nslm2.utils.PlayerVoUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.greensock.TweenLite;
   import nslm2.modules.battles.battle.FPUtil;
   import com.mz.core.utils.FilterUtil;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   
   public class PeakSportsFightResultHeroRender extends PeakSportsFightResultHeroRenderUI
   {
       
      
      private var _battlePlayer:BattlePlayer;
      
      private var _hpPer:Number = 0;
      
      public function PeakSportsFightResultHeroRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            this.visible = true;
            this.nameUseLink = false;
            _battlePlayer = (param1 as PeakSportsFightHeroVo).battlePlayer;
            .super.dataSource = PlayerVoUtils.battlePlayerToPlayerVo(_battlePlayer);
            _loc2_ = StcMgr.ins.getNpcVo(_battlePlayer.npcId);
            if(_loc2_.kind == 21)
            {
               this.list_tupo.visible = false;
               this.progressBar_hp.visible = false;
               this.txt_hpValue.visible = false;
               TweenLite.killTweensOf(this);
               this.filters = null;
            }
            else
            {
               this.list_tupo.visible = true;
               this.progressBar_hp.visible = true;
               this.txt_hpValue.visible = true;
               if((param1 as PeakSportsFightHeroVo).isEnd == false)
               {
                  TweenLite.to(this,0.2,{"hpPer":(_battlePlayer.prop.hp + FPUtil.getAddHpByBuff(_battlePlayer)) / _battlePlayer.hpMax});
               }
               else
               {
                  TweenLite.to(this,0.2,{"hpPer":_battlePlayer.prop.hp / _battlePlayer.hpMax});
               }
               if(_battlePlayer.prop.hp == 0)
               {
                  this.filters = [FilterUtil.grayFilter()];
               }
               else
               {
                  this.filters = null;
               }
            }
         }
         else
         {
            this.visible = false;
         }
      }
      
      public function get hpPer() : Number
      {
         return _hpPer;
      }
      
      public function set hpPer(param1:Number) : void
      {
         _hpPer = param1;
         this.progressBar_hp.value = _hpPer;
         this.txt_hpValue.text = LocaleConsts.percentStr(_hpPer);
      }
   }
}
