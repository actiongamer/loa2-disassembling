package nslm2.modules.battles.battleStatistic
{
   import game.ui.statistic.LeftHeadUI;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.greensock.TweenLite;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.common.compsEffects.MaskProgressBar;
   
   public class BSLeftRender extends LeftHeadUI
   {
       
      
      public function BSLeftRender()
      {
         var _loc2_:int = 0;
         super();
         var _loc1_:MaskProgressBar = new MaskProgressBar(this.progress);
         this.parts.push(_loc1_);
         this.img_border.smoothing = true;
         this.dot.y = this.progress.height / 2;
         this.progress.addChild(this.dot);
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            this["d_" + _loc2_].smoothing = true;
            _loc2_++;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         .super.dataSource = param1;
         if(vo.isMajor)
         {
            if(ClientConfig.firstBattle == 1)
            {
               _loc3_ = 3;
            }
            else if(vo.serVo)
            {
               _loc3_ = MilitaryModel.ins.getPlayerQuality(vo.serVo.avatar[2]);
            }
            else
            {
               _loc3_ = 3;
            }
         }
         else
         {
            _loc3_ = vo.stcNpcVo.quality;
         }
         var _loc2_:int = _loc3_ - 3;
         _loc2_ = Math.min(Math.max(0,_loc2_),4);
         this.img_border.value = _loc2_;
         this.txt_name.text = vo.name;
         this.txt_name.color = ColorLib.qualityColor(vo.stcNpcVo.quality);
         if(vo.serVo)
         {
            this.txt_level.text = "Lv." + vo.serVo.level;
         }
         else
         {
            this.txt_level.text = "Lv." + vo.stcNpcVo.level;
         }
         var _loc5_:int = (vo.stcNpcVo.tupo - 1) / 3;
         var _loc4_:int = (vo.stcNpcVo.tupo - 1) % 3;
         _loc6_ = 0;
         while(_loc6_ < 3)
         {
            if(_loc6_ <= _loc4_)
            {
               this["d_" + _loc6_].visible = true;
               this["d_" + _loc6_].value = _loc5_;
            }
            else
            {
               this["d_" + _loc6_].visible = false;
            }
            _loc6_++;
         }
         this.img_head.url = UrlLib.headIcon(this.vo.stcNpcVo.head_id);
         switch(int(BattleStatisticModule.type))
         {
            case 0:
               showDamage();
               break;
            case 1:
               showHurt();
               break;
            case 2:
               showHeal();
         }
      }
      
      private function onUpdate() : void
      {
         this.progress.commitMeasure();
         this.dot.x = this.progress.bar.width;
         this.dot.visible = this.dot.x < 150;
      }
      
      private function showHeal() : void
      {
         this.txt_sum.text = vo.sumHeal.toString();
         var _loc1_:* = 0;
         if(BattleStatisticModule.healMax > 0)
         {
            _loc1_ = Number(vo.sumHeal / BattleStatisticModule.healMax);
         }
         TweenLite.to(this.progress,1,{
            "value":_loc1_,
            "onUpdate":onUpdate
         });
      }
      
      private function showHurt() : void
      {
         this.txt_sum.text = vo.sumHurt.toString();
         var _loc1_:* = 0;
         if(BattleStatisticModule.hurtMax > 0)
         {
            _loc1_ = Number(vo.sumHurt / BattleStatisticModule.hurtMax);
         }
         TweenLite.to(this.progress,1,{
            "value":_loc1_,
            "onUpdate":onUpdate
         });
      }
      
      private function showDamage() : void
      {
         this.txt_sum.text = vo.sumDamage.toString();
         var _loc1_:* = 0;
         if(BattleStatisticModule.damageMax > 0)
         {
            _loc1_ = Number(vo.sumDamage / BattleStatisticModule.damageMax);
         }
         TweenLite.to(this.progress,1,{
            "value":_loc1_,
            "onUpdate":onUpdate
         });
      }
      
      private function get vo() : UnitVo
      {
         return _dataSource as UnitVo;
      }
   }
}
