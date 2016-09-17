package nslm2.modules.battles.battle
{
   import game.ui.fightPlayers.FightStarUI;
   import morn.core.components.Component;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.fightPlayer.UnitView;
   import morn.core.utils.StringUtils;
   import com.greensock.TimelineLite;
   import com.greensock.easing.Linear;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import com.greensock.easing.Elastic;
   import com.mz.core.mgrs.UIMgr;
   import flash.display.DisplayObjectContainer;
   
   public class FightStartEff extends FightStarUI
   {
       
      
      private var _compFunc:Function;
      
      private var _head:Component;
      
      public function FightStartEff(param1:Function, param2:Component)
      {
         super();
         _compFunc = param1;
         _head = param2;
         this.commitMeasure();
         var _loc3_:DisplayObjectContainer = UIMgr.layer2D;
         _loc3_.addChild(this);
         this.txt_name_l.font = "Microsoft YaHei,微软雅黑";
         this.txt_name_r.font = "Microsoft YaHei,微软雅黑";
      }
      
      public function go(param1:DictHash) : void
      {
         var _loc2_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = param1.array;
         for each(var _loc4_ in param1.array)
         {
            _loc2_ = _loc4_.vo.serVo;
            if(!StringUtils.isNull(_loc2_.name))
            {
               if(_loc4_.vo.isAttack == 1)
               {
                  this.txt_name_l.text = _loc2_.name;
                  this.txt_fightValue_l.value = _loc2_.combatPower;
               }
               else
               {
                  this.txt_name_r.text = _loc2_.name;
                  this.txt_fightValue_r.value = _loc2_.combatPower;
               }
            }
         }
         var _loc3_:TimelineLite = new TimelineLite();
         var _loc5_:* = 0;
         this.img_middle.visible = false;
         _loc3_.from(this.img_left,0.1,{
            "x":-200,
            "ease":Linear.easeNone
         },_loc5_);
         _loc3_.from(this.img_right,0.1,{
            "x":img_right.x + 200,
            "ease":Linear.easeNone
         },_loc5_);
         _loc3_.call(showMiddle);
         _loc3_.to(this,0.2,{
            "alpha":0,
            "y":this.y - 100
         },"+=1.5");
         _loc3_.call(over,null);
      }
      
      private function showMiddle() : void
      {
         this.img_middle.visible = true;
         new ScaleTweenEff().init(img_middle,0.5,2,1,Elastic.easeInOut,false);
      }
      
      private function over() : void
      {
         var _loc1_:* = undefined;
         if(this.isDisposed)
         {
            return;
         }
         if(_head && _head.isDisposed == false)
         {
            _loc1_ = _head.parent.parent;
            if(_loc1_.visible == false)
            {
               _loc1_.visible = true;
               _loc1_.fadeIn(0,40300);
            }
         }
         if(_compFunc is Function)
         {
            _compFunc();
         }
         this.dispose();
      }
   }
}
