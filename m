Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE51459AE6
	for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 16:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515182; cv=none; b=UR4CS6JJVbdHSra0ityErfF03o9OpsgM7B+48W/8/lZgcvb7VDh7rcsjyfcQgOqhu4iiRPUBh5If00H44m2ADloYLVTkNcxe2bMZkdqWHdfsWRSMLH3qt5/b6LrMyklYC1z0yb9oPrPTwGdVWfRUd1G9JFSdUSWaRRH1gyaDAn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515182; c=relaxed/simple;
	bh=8pT4GfINvG3duG6dP09F+hI4qE8C8BGPYMHMoX6nFho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQg/id/Z11wpMkPTcg9f30Hizu7Ck+h86ETAM4aTkol7NPJW5oElzaK5735S1PpYEA4nhkZq/f5B80d5VnD4oSrYNBFjgHM+ZIuIhXc8JRj/JtIsjCPpf6S6d54C5Xipd4A5uRg7SIsGys60yH6XXRGW5MMlg5CTGBz1Livqz00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hf20twtD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hf20twtD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15c42a45adso319214066b.0
        for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 09:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1785515175; x=1786119975; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZgnNTfFrNH5Ao2efM12gnUM2kdkogYLn1f6O6OwYWw=;
        b=hf20twtDvrB2foqGWmSdJQ3m6k493QFI3/p/o0k0L39+lLOdm9dJi1KzOdGIHEw5cO
         Xlgw03B6ILxWLlB5Ghuy2FvapF5KSjTEY4HsdWw2DOTsTDbe1IfM9EFlJv46k0NLEepW
         JW4MJ/3nYIwkRQ/imwYTc0v/BQZqqyFKNypGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515175; x=1786119975;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NZgnNTfFrNH5Ao2efM12gnUM2kdkogYLn1f6O6OwYWw=;
        b=Wq35y8k/sq6TO/6yAeLgHyr0L3drRAQxgp2nxx4PCZRRcLdDdKLM0fZHSOkHBexA/v
         XQNLkYQ/3hDrDucOs/p++QF4UBcjOZrGqUmUzicF7+nXdeNDmmLU4VntBfUr/FfIaVje
         IAPrXUEe4z5G/rbJ1GVEeFFvpZo12HONYLGoU/fK969Z5CXQMOw3v2EWBoFfPYCbalRR
         pg8DGFARRcp3h5fwJuKUnk3rKu5dM6NwQY9oTDl7FLWeagtTvd6d9Po9pfEyfereguaX
         6w6jEGzSpgWZM6KprSCiEjjwR0ffeyd7nReq5Tx8qFcmSbnb01oBEQ0KMmcWAGYG0fXR
         b6Kg==
X-Forwarded-Encrypted: i=1; AHgh+RpSgKeEopxPhSiUcfMAa8Cs6BwZ5s3YWx8q51IDvMN/zWN6iTU0B1w69Gntqc2PNuYuydUqf2Ubaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiaEzDGz+ygqwXabtb7CMPRZj4d9jXk34uksICIw6XF14pAFt5
	65bpIjuroWuRtc439H1OWVdgoguhVaw9lYGs8TzipcUzzwq42lHj2fEY8yV22t+krT4ba6rcnJO
	sNR2+gQ0=
X-Gm-Gg: AR+sD13w+J1HrhIaPvP6RlA32/wOHkwDOFSasmhgFQWQYu3ClhArqiffaRemd5kExZd
	qe9J0Yk/8I19GTXOnOstrnmypAaMCuoPm2/RlbwCgvY13iegdYaw/BN/klwTh7RyKhzcs9Ty9eK
	+qN1s4bDLPt06k6nV8Wu7/0CATUfxvG63PpFItCiY7ia/gQZOASB79H82Hv2xGDYrOQRUyyoKk4
	215KO4O+p10eHNf9vq60LGlNu53uY7Rc0licZDx+5QlNc2AjRppumo3MwHv/Hb0HVWg6xgyCLy7
	zh2fjOwb5lQGddTq/vI/0xpa9Q1GS3H+i5QBwXrghfY7By24Oj2YdIW7xeWdOI+R7Kl9lV8fxCV
	AEG2T8+zRkovIcHfy8mgzjg3d5tMfnR5XdpeMTP+8c28efOxhii3N9vmCF0jsuD9x4GGg0mi9JG
	nN5RuX90319N5AXNbcNlPiGWd6VJKr44TS4/zCjatLow8Z5dTfQZe0AH7NUb3rJuOCA67SY3vo4
	nv4hBQDSxzrmRi2hlOxTtki7Pus0JTe++x5Ww==
X-Received: by 2002:a17:906:f585:b0:c16:e0b:bd2d with SMTP id a640c23a62f3a-c1fd368311fmr156342466b.27.1785515175524;
        Fri, 31 Jul 2026 09:26:15 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5a0556sm2524806a12.5.2026.07.31.09.26.15
        for <io-uring@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:26:15 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1600d040e4so167866766b.1
        for <io-uring@vger.kernel.org>; Fri, 31 Jul 2026 09:26:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp9M2TvUSUpNM1Pljio7m1i4ZAagn6kGSNRPyAPdxfhHIGkupwP2ome1kxyVB7aliHTutRGZSmIOw==@vger.kernel.org
X-Received: by 2002:a17:906:99ce:b0:c1c:1fbf:5d18 with SMTP id
 a640c23a62f3a-c1fd316d100mr201595366b.3.1785515175103; Fri, 31 Jul 2026
 09:26:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amtbpwrhlNGJ9OK6@redhat.com> <CAHk-=wi7EccGaeo2Q5mdcvcQJ8VX7tcJWW2fHkg6vfmHGGX8AA@mail.gmail.com>
 <amueLRM-DrYbnjLn@redhat.com> <20260731-blechnapf-arten-blasorchester-4e05dd1b2c58@brauner>
 <amysHlZp6f6q498X@redhat.com>
In-Reply-To: <amysHlZp6f6q498X@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Jul 2026 09:25:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_PtU66p4iuvzCz13P_cDCfKg2OOuV-v6wq19ua8LyvQ@mail.gmail.com>
X-Gm-Features: AUfX_mxg27Kg07NK3K1byK9KwocM4glZNJ49A7mvHpifqZOMR1EOAwQNVrEvm6Y
Message-ID: <CAHk-=wg_PtU66p4iuvzCz13P_cDCfKg2OOuV-v6wq19ua8LyvQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] pipe: only enable the extra wake_up(rd_wait) for
 edge-triggered consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Alexey Gladkov <legion@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 07:07, Oleg Nesterov <oleg@redhat.com> wrote:
>
> It seems that Linus doesn't really like this patch "in general", lets wait
> for reply from him...

No, I like the patch, but I want the naming to be about the *reason* for it.

The problem it tries to solve is literally that some people think
"edge" means something completely %^@% different from reality. We had
legacy epoll users that used edge-triggered events but wanted
level-triggered semantics.

So it got literally hacked up the minimal way possible.

If we change this to be something that isn't the minimal way possible,
we should do that *right*. we should make it clear that it's a hack
for user space behavior where user space was simply asking for the
wrong thing entirely, and it happened to work because we would send
wakeups willy-nilly for everything, so even level things that didn't
change at all ended up getting those "something changed".

But "user space is doing crazy things" isn't an excuse for the kernel
breaking user space, so thus that "we'll just continue to do our extra
notifications if you use poll".

You are now changing it. And what I disagree is that "change it to be
something else than the minimal thing, but make the naming be bad and
the explanations for the non-minimal thing be bad".

My argument is that IF we change this area, we should damn well do it
right, and document it, and make it very very clear that the *ONLY*
reason this exists is a user space legacy bug that took advantage of
legacy kernel behavior, and that we are papering this over.

               Linus
