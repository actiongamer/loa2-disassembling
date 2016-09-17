package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.props.FightValueBoxS3UI;
   import com.mz.core.interFace.IFightValueBox;
   import flash.display.BitmapData;
   import morn.core.components.Label;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class FightValueBoxS3 extends FightValueBoxS3UI implements IFightValueBox
   {
      
      private static var _insForDraw:nslm2.common.ui.components.comps2d.others.FightValueBoxS3;
       
      
      public var initFightValueName:int = 11000857;
      
      public function FightValueBoxS3()
      {
         super();
      }
      
      public static function get insForDraw() : nslm2.common.ui.components.comps2d.others.FightValueBoxS3
      {
         if(_insForDraw == null)
         {
            _insForDraw = new nslm2.common.ui.components.comps2d.others.FightValueBoxS3();
         }
         return _insForDraw;
      }
      
      public static function draw(param1:Number, param2:int = 11000857) : BitmapData
      {
         insForDraw.initFightValueName = param2;
         var _loc6_:Label = insForDraw.txt_fightValue;
         insForDraw.value = param1;
         insForDraw.commitMeasure();
         var _loc5_:int = _loc6_.width;
         var _loc3_:int = insForDraw.height;
         var _loc4_:BitmapData = new BitmapData(_loc5_,_loc3_,true,0);
         _loc4_.draw(insForDraw);
         return _loc4_;
      }
      
      public function set value(param1:Number) : void
      {
         if(param1 >= 0)
         {
            this.txt_fightValue.text = LocaleMgr.ins.getStr(initFightValueName) + " " + "+" + Math.abs(param1);
         }
         else
         {
            this.txt_fightValue.text = LocaleMgr.ins.getStr(initFightValueName) + " " + "-" + Math.abs(param1);
         }
      }
      
      override public function commitMeasure() : void
      {
         this.txt_fightValue.commitMeasure();
         super.commitMeasure();
      }
   }
}
