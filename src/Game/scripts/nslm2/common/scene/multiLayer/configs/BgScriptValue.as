package nslm2.common.scene.multiLayer.configs
{
   import com.mz.core.utils.MathUtil;
   
   public class BgScriptValue
   {
       
      
      public var value:Number;
      
      public var random:Number;
      
      public function BgScriptValue()
      {
         super();
      }
      
      public function parse(param1:XML) : void
      {
         this.value = Number(param1);
         this.random = BgConfigVoUtil.parseXMLNumber(param1.@random,NaN);
      }
      
      public function get newValue() : Number
      {
         if(isNaN(random) == false)
         {
            return MathUtil.randomRadii(value,random);
         }
         return value;
      }
   }
}
