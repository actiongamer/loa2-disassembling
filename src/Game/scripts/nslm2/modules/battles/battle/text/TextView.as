package nslm2.modules.battles.battle.text
{
   import com.mz.core.display.MzSprite;
   import com.mz.core.interFace.IUniqueId;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import morn.core.components.Label;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.utils.UniqueId;
   
   public class TextView extends MzSprite implements IUniqueId
   {
      
      public static const TYPE_HURT:int = 0;
      
      public static const TYPE_HURT_CRIT:int = 1;
      
      public static const TYPE_HEAL:int = 2;
      
      public static const TYPE_HEAL_CRIT:int = 3;
      
      public static const TYPE_SHANBI:int = 4;
      
      public static const TYPE_GEDANG:int = 5;
      
      public static const TYPE_XISHOU:int = 6;
      
      public static const TYPE_MIANYI:int = 7;
       
      
      private var mx:Number = 0;
      
      private var url:String;
      
      public var _uniqueId:uint;
      
      public function TextView()
      {
         super();
         this._uniqueId = UniqueId.next;
      }
      
      public function get uniqueId() : uint
      {
         return _uniqueId;
      }
      
      public function setNum(param1:int, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc3_:int = 0;
         switch(int(param2))
         {
            case 0:
               url = "battle_digital_red";
               break;
            case 1:
               url = "battle_digital_red_crit";
               break;
            case 2:
            case 3:
               url = "battle_digital_green";
         }
         var _loc9_:Vector.<BitmapData> = App.asset.getClips(url,11,1);
         App.asset.addCited(url,this);
         var _loc8_:Array = [];
         if(param2 == 1)
         {
            _loc6_ = App.asset.getBitmapData("battle_text_crit");
            _loc4_ = new Bitmap(_loc6_,"auto",true);
            _loc4_.x = mx;
            mx = mx + _loc6_.width;
            _loc4_.y = -5;
            addChild(_loc4_);
         }
         else if(param2 == 3)
         {
            _loc6_ = App.asset.getBitmapData("battle_text_heal_crit");
            _loc4_ = new Bitmap(_loc6_,"auto",true);
            _loc4_.x = mx;
            mx = mx + _loc6_.width;
            _loc4_.y = -5;
            addChild(_loc4_);
         }
         _loc8_.push(10);
         var _loc5_:String = Math.abs(param1).toString();
         _loc7_ = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc3_ = _loc5_.charAt(_loc7_);
            if(_loc3_ == 0)
            {
               _loc3_ = 9;
            }
            else
            {
               _loc3_--;
            }
            _loc8_.push(_loc3_);
            _loc7_++;
         }
         _loc7_ = 0;
         while(_loc7_ < _loc8_.length)
         {
            _loc6_ = _loc9_[_loc8_[_loc7_]];
            _loc4_ = new Bitmap(_loc6_,"auto",true);
            _loc4_.x = mx;
            mx = mx + _loc6_.width;
            addChild(_loc4_);
            _loc7_++;
         }
      }
      
      public function setType(param1:int) : void
      {
         var _loc2_:* = null;
         switch(int(param1) - 4)
         {
            case 0:
               _loc2_ = "battle_text_shanbi";
               break;
            case 1:
               _loc2_ = "battle_text_gedang";
               break;
            case 2:
               _loc2_ = "battle_text_xishou";
               break;
            case 3:
               _loc2_ = "battle_text_mianyi";
         }
         setText(_loc2_);
      }
      
      public function setText(param1:String) : void
      {
         var _loc2_:BitmapData = App.asset.getBitmapData(param1);
         addChild(new Bitmap(_loc2_,"auto",true));
      }
      
      public function setText2(param1:String, param2:int) : void
      {
         var _loc3_:Label = new Label();
         _loc3_.style = "渐变1";
         _loc3_.width = 600;
         _loc3_.height = 80;
         _loc3_.text = param1;
         _loc3_.size = param2;
         _loc3_.align = "center";
         addChild(_loc3_);
      }
      
      public function clearAll() : void
      {
         if(url)
         {
            App.asset.removeCited(url,this);
         }
         DisplayUtils.removeAllOfContainer(this);
      }
   }
}
