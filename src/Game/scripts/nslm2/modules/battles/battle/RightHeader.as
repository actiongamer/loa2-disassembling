package nslm2.modules.battles.battle
{
   import game.ui.fightPlayers.RightHeaderUI;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.utils.PlayerVoUtils;
   import flash.events.Event;
   import nslm2.common.compsEffects.MaskProgressBar;
   
   public class RightHeader extends RightHeaderUI
   {
       
      
      private var _unitVo:UnitVo;
      
      public function RightHeader()
      {
         super();
         var _loc1_:MaskProgressBar = new MaskProgressBar(this.progress_hp);
         this.parts.push(_loc1_);
         this.progress_hp.alignRight = true;
         this.img_point.y = this.progress_hp.height / 2;
         this.progress_hp.addChild(this.img_point);
         nameUseLink = false;
      }
      
      public function set unitVo(param1:UnitVo) : void
      {
         this._unitVo = param1;
         this.playerVo = PlayerVoUtils.unitVoToVo(param1);
         _unitVo.addEventListener("valueChange",vo_changeHandler);
         vo_changeHandler(null);
      }
      
      private function vo_changeHandler(param1:Event) : void
      {
         this.txt_hp.text = _unitVo.hp + "/" + _unitVo.hp_max;
         this.progress_hp.value = _unitVo.hp / _unitVo.hp_max;
         new HPTween(progress_hp.bar,16711680,false);
         this.progress_hp.commitMeasure();
         this.img_point.x = this.progress_hp.bar.x + 1;
      }
   }
}
