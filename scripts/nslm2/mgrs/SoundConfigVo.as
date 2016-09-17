package nslm2.mgrs
{
   public class SoundConfigVo
   {
       
      
      public var _backName:String;
      
      public var _backRepeat:int;
      
      public var _backPlay:Boolean;
      
      public var _backClear:Boolean;
      
      public function SoundConfigVo()
      {
         super();
      }
      
      public function get fadeInMs() : Number
      {
         return 3;
      }
   }
}
