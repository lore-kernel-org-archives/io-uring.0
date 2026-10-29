Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793302456;
	b=lOcJaYS3/dXhiA+vOJGWOjnIoX+s6cPIEzIgWu0+Q+5ZFAFfEZHNOKSRONBWi56d2sDU
	 VK5AoSTfMcWyKucUijAw8hKy6tvOM6jZFdz0dJMUS2W1nT961JB3Q93RX+SFvxuJo78rO
	 QTz/mcYLX7PIk8kN/hK1gJf7MXonFl4HoruU+IeuPwfBVfCtq9hOWVLvohRSc/wuBQ5xX
	 DCTFUGcnxCk3Mwtb67sowOjsmEIKendEXpLs2atYUo/hWAmSp2E63VE12ciTkd+JCmQlS
	 4VB1Y2vz2pIBApt7UCEwCQACuzGa1XmKn6Mps+xMZJsoFrmghDqBEaQs2N2Ru8QImqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PrPeOIuHtH+A+T7RUTXwTfzDYcpfiOwiZCYBv8oLj2g=;
	b=4Dt5Wel+LlmdxPtR0lCSkTdconL9q/tOGFlY06PAMeD76qdzRFeTpjFZUs+DeBEIsFFw
	 IUssxEGbZ9NBOJ2JhvQCwDBrMS7OvP/kWEmyNMVIdclrC6pVlaQOm7iuq4Ppay+xU/QGY
	 GDLNLmS5T73LFvHUi2AHTniguhKWIWYL0jCEefPRs/HE8wIm1VGHZnS0jCjKc+RgM6qux
	 S2P1kNXMbKdY87RORJFnLQCUQjynVhKK6UtI3aeawS+rbpto3Ebu3ddO7GR70O9TYmPEj
	 Ux8JTe7Ccjht1s3WGmS8Kloc1vntjaiEQxUCzVI0avfFbUMvfLpSGb3YWhp9VB7NzSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openresty.com;
	spf=pass smtp.mailfrom=openresty.com;
	dkim=pass header.d=openresty.com header.i=@openresty.com header.a=rsa-sha256 header.s=google header.b="Tz/vHtGr";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927DC606A31A
	for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 19:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 927DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openresty.com header.i=@openresty.com header.a=rsa-sha256 header.s=google header.b=Tz/vHtGr
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc758830601so1690247a12.2
        for <io-uring@vger.kernel.org>; Thu, 29 Oct 2026 12:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793302455; cv=none;
        d=google.com; s=arc-20260327;
        b=j83uR3vxFiUBFVHdIhZFHy2FUB4Rex/b9Y96Q4W8k9zJW/KMTYxVI09wan25zXHWvd
         X6dWOpTw+ss4ukl9BQrjgTJaYCQKPafXRu6BntwwBhJBdk4fTyNKFDijaSLlC6dRB3//
         H++r2I80EykkMG37CdS251HgC6etWWowuFWSRAg3kDgwbk6tMObJpTnxzoSuPmOADyIP
         Iz6Mk7m3adAvGWExq6sRf8/pVQTDllsnTS0TCId2h8Q04kwSZN66ar7zeqL9abVMQ2Ic
         r6HzNd58J5xA7z3l7BNnjMwXavrd/bjus4+9teW8bwwfUPO/jmzMCbfa67xyVS5REC5D
         Xzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PrPeOIuHtH+A+T7RUTXwTfzDYcpfiOwiZCYBv8oLj2g=;
        fh=R/NUNQKl6//HDJNjlQeQq8Ey0m8r+CI74DSmAPbPqzU=;
        b=ZpvsEu+JFgXv3OdnJMnseDtFH9F42W9kSHqyikaR74DqWJ0d4ApqmniROe0F3eysl2
         isVbwlOqSxZIKhTiB+2Dzs068zWT2jR/lbvlsUb86o4xg4OLzjrLFZZ/fksAUkHAly+g
         TI3k8HTV2ZoNTaqG+SiOKvzyQj2SWhvRTHRKZ8Al36qhhSNOLexiWmHT5oRadMkhDIiA
         1k24Knx+ew7oOnao8ENIj+S57Rsvjepar02e8BoB7QcDjto6W8Hc1n88pGbhZwAOwgOE
         b8yOBKUexQMplDXv4FBGUZ2kZxMMTl0JJ81eOql6rhybX7JhS1qAdn/K2Hs6Fy4PjSJL
         cnGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1793302455; x=1793907255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PrPeOIuHtH+A+T7RUTXwTfzDYcpfiOwiZCYBv8oLj2g=;
        b=Tz/vHtGrd67X2/kWyu1VYk7ljckUhUJVXZAyTUGjqJkdi+uKQrwBPSWIt739wGtYm0
         HzxRS7UbhGXNM2eqoiQTGhpynrbSFPNq+f2txHpN1QtU12BTwKB1UuRo+JXp/9tSEUTv
         g/hQv4vq2CEXNEsgTlJ8TdYuZSRq0F1A4WPl5o4iMXh9u9M+DvkLrHhC6lyJTK1VT6AW
         IOblsClPEyuigpHYvOzMk8ZMWH9pU1brm9XvwQVgoZvw05EV/KvJXFaAeRv99I+DNaB+
         gVQEXIixwrNTSOZvHmwVoexHA+S3BLO6RKCWxYdUcrGjfSkpaVoeozC18Q32QLI73pjp
         LUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793302455; x=1793907255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrPeOIuHtH+A+T7RUTXwTfzDYcpfiOwiZCYBv8oLj2g=;
        b=0P0xEKtQVxaxClOAF3A1/j8ADfYEiTkX7z02EPylsUiOVojc6Y61rrCzRl7FZqME1b
         YYmzJ6Kxe/MUScW86/L23T1XxzQK4Ass+JNfg5/pxU1nvIZm1pJ9OcZ1b/BPVJEcb5H3
         lIE3m61CqH1eV9rrwicdT5zhhmossdzN3t+tKQnJqJTwY3gDxzBG7hf0wIsHZ5E1vzSc
         dXhgD/So7xu2uZL/tKZ/W0KU51kyYmCjymkLPmBSzUUSmdueZcWw0TUs2O6WuqiJn9uJ
         Fhu09BgDBqPhZiRXFqpz21sbcpJcnszSmhU7PMqgN1KGBO1qbsiEaxqjcdx6E4lkJ7bz
         qdGw==
X-Forwarded-Encrypted: i=1; AKwUvBzy4GmSbGvS1Wj2SnE6q5vJbwbXdxvYWldR30bN/jgoViRCMjMF80vV+jgOy1a79x3XRvyXcUkCxg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK6SbfmeElqfnxpJAzqPQN/l8lBZynpj4Vxr/yH/8aZqzUDFoIQ
	YP0TV96ARXS9wNuOSVgrxsMw5nQEV3PHvIW9KMZaIhxXJCwRHtr30mQB3eRxtUZYcyYhIJggbfc
	u4mui2qXnnkB0TPk9Jbu6zG5gygLDbJWJ+ah1m2EOyA==
X-Gm-Gg: AYBFou2jQZAPo3LDl/ttquME7RRxVSA7JnI3V+UakqJvMGsEd+Czf5lnV/Iz9T3ES/w
	m30mvdIiUg3Er1YkHxv6lOCMFM4vPEJTCj9ecjJwSXhwO/nzdzU3twiT3QOk7z+s/2kxN+kbluB
	HlPImvsv7o/U33qd3CzsP+yShEZksClKoxUnoiamBSwzQKKeHTYr7HTZjGkPuRbgbhhuyS6s21Y
	5f8xemDgSV0CDmDfFBAxaGmBnE+TOZoed1sc7ykTHXsVy6BCZbTAWsEQZtzqZ+gbLTsjX017cWp
	LHSejjkpJHZnOHIeMLZzJhB5W1tPDZd7Pcd1SrQsFglCwY7Q0V7r8tz3NCmqynqKPYzHL0oJq9T
	6UkHnh+MZrQPpOl7XFf7azb21dyMbFdKVerwa5RH1XAIL1AHq3PPUKoH8I6D/DU7VuqZz7GI=
X-Received: by 2002:a05:6a21:3981:b0:3e2:7a05:6bda with SMTP id
 adf61e73a8af0-3e928d5c53bmr258292637.43.1793302454985; Thu, 29 Oct 2026
 12:34:14 -0700 (PDT)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029192003.940655-1-ammarfaizi2@openresty.com> <hx7hcr2iwnkvcz4p2kizv3kzcq@gnuweeb.org>
In-Reply-To: <hx7hcr2iwnkvcz4p2kizv3kzcq@gnuweeb.org>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Fri, 30 Oct 2026 02:34:01 +0700
X-Gm-Features: AclHuK8QUx3YDKxTpy2V1GY6MYKfhlgHeCjZ1H9AhttStoXlFP66-DqnhsPHirE
Message-ID: <CA+KFgX5WrBQW4qQ9sf4UFwoR4wURjKrJPT9s=dXo589hdPxRsw@mail.gmail.com>
Subject: Re: [PATCH liburing] ci: Temporarily remove alpine-musl-build
To: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Cc: Jens Axboe <axboe@kernel.dk>, io-uring Mailing List <io-uring@vger.kernel.org>, gwml@gnuweeb.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 2:30=E2=80=AFAM Alviro Iskandar Setiawan wrote:
> It's already up today.

Oh nice! Thanks for checking. Jens, ignore this patch.

--=20
Ammar Faizi
