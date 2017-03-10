aspect Hello {
    before(): call(void Sample.run()) {
        System.out.println(">>> Calling run");
    }
}

aspect Fib {
    before(long n): call(long Sample.fib(long)) && args(n) {
        if (n < 0) {
            throw new IllegalArgumentException("fib is undefined for negative numbers");
        }
    }
}

aspect RootCall {
    pointcut rootFibCall(long n):
            call(long Sample.fib(long)) && args(n);

    before(long n): rootFibCall(n) {
        System.out.println("<<< fib(" + n + ")");
    }
}