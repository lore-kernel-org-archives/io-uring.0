Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94FB36EAB8
	for <io-uring@vger.kernel.org>; Fri,  2 Oct 2026 06:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921076; cv=pass; b=KUyXtun2k0eT0Rb+BAsoRuon17WlqQjWUXakqxXBKM6Le7TnHL7EN2/pYGW0J3NNQGkFcq8FZ6ruuVHAvFj0BpLjPuiPzbzIaeOlSwwOeo4wXJ1eUUJqaJ8/5qaLjL8Uhff51qnKyHqotR5kiB9GFO3o9g0NDCqtL8SV3gMbjm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921076; c=relaxed/simple;
	bh=O4p10DvGJtAEkmkiTAv3pxmj0FlZKDktqwxkxncemtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HB417RFpie3ngMW6K1LcMlxwpHvb3DKYbWC5LvLmUM4qejTY7nPF9XfcqD6oVIHs5lIkwurelWxpvGi4elO4ax37dAhUBT6OScrpbqMoD5GckEKGjt75EUsdeCZForK0iejwhyy7ihmTl9bj8OmU235/Wf7USILPEPwyHMUuGd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6mbzwVR; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6mbzwVR"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6dfd65cc5ebso18996eaf.0
        for <io-uring@vger.kernel.org>; Thu, 01 Oct 2026 23:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790921074; cv=none;
        d=google.com; s=arc-20260327;
        b=QwqvZNnQMKp3kLzRjWs9wlKLh0jPzzl9BM8Uh2YR0Wapx71HNsbolX90JN8tORgsa8
         ZLTVouMoTfoOy7rO2+NAKYTQQhjRB2r2M57KDyhxbXhTBG2qk59uqtu6gTn5TW6IHY7W
         IHrZXuVk4AEkIm20MGay0zAGe67dojQAUfxsXVztofearKz4IEJ0QJnL5tHXIulMknqn
         tCQxgFPEJ2Zt9T3S/k/xTKkSc5SyM42Q6TWLWm26hPILrm/GCoKX9wXKupexJBY8tjV6
         cwPH/N23zo5PALWrUPwpZd0U8+COF3R0anV9vY2Fkdqb5NnrUvQ98keiivoTLes0VgJ0
         Gi+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UM2JzAgkGD7BHOZnHMq8unejo4FpCXzpYWfXmWGl2mQ=;
        fh=AehLoUzC8LgTDnuu/DqYei7Ago40Rv0v938CeV6GWu8=;
        b=N0JbtySZLhKnI+J7/w3/pzGscLQotj1VUB/OdsoTw2igjfbmAQMQDlKSqXKL3r8tBc
         l/OuUGDxg25BB3pzUlvUhXkYEQapsW8mvsLbpLah4GTxuXyqVfx/U8h2dwehPZyIBY6J
         1as63NGMFlis8x0zAhVdOXcedvyAqBVnwBkD2hKQG7UERqDaNLYScII8CMzrBekp8QM8
         jE0qPwCqbbZ7k1S6k+HtRZ+RkH/BnqEljJhi6MfgILTOfotfxS4opeGPfih0sHRQmvSq
         +b/QBN615Tnm9mjy67A8tTgEsKbrbTbHUbflPq5PH27EALrslB+RIYcLC/TTFqCwYWpV
         adNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790921074; x=1791525874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UM2JzAgkGD7BHOZnHMq8unejo4FpCXzpYWfXmWGl2mQ=;
        b=K6mbzwVRrveB30sOj45FGnFHwUyDTJrsP2ZAh+YZ57ydee7xIW6UvOooKvWgoF2QNp
         nHiTsgggVsRXSfmBXCAqrcn5MOa2NxjfDaQrrRpWVpR2jVtSDPXDVe7vg08dwAXZqiTb
         PkJluYyqPwiNse+V2GASy6W+awv5Q30aw49lLu0i3co/g4Wbtc0Y/0sCx/AQ/zkj2yzt
         AYHo7D6Ma3sBG1ORQNvHNo7l6f6K4KcMhiphbpijovIk6ncuOBfR7Y+dd83fAbl0BfC0
         zOe82Y1mupoZzIVpEijMbAJInmXRDXFA7RGD004UQnjVSzsWEVabIOuOeccBQf6GuRXE
         qQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790921074; x=1791525874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM2JzAgkGD7BHOZnHMq8unejo4FpCXzpYWfXmWGl2mQ=;
        b=wbatxp+hSXzA1xK5YreIDTe6VY4DZcelvYZADfGhHjoK13Lbp4DR7qFnGZ6XAf0aPc
         hSy5VDRNfiimgb/aJPxe7PuyqX+ozbtxdonqwOSzM/DKD3JCejEEAs9gVVZ9ArXgL+Q9
         MVVsaKHcoRJM2R0PKj/DKG2+bYM2EWCm4PjyFpeVHw2Xa5LrXqD1cdrokbzkiyMltC8j
         ZuTzdQFa5mvBTTHoxv1sq3KSG7I/xNVOk3G/eh1KHRJiUwWfru2FSRdkN9Kbhgy/EF7i
         oiL7HY6KEPlHA7a9k+9AEvNGZDuuyCIFVGR3pvucO4QhZlwZpPSoo1t21GQjqzHBilA/
         oR9g==
X-Forwarded-Encrypted: i=1; AKwUvByeNKffM/jC8Z/hQYyRWoBDokWWlFv7ucpNqZ7SZ7BJwzNnfucWSTIhZWVmSd76xYGhjs3fKlff3g==@vger.kernel.org
X-Gm-Message-State: AFuF++k5o5Pg8hnwsAqHiVRLev5lnSCWl45XKaKREpUI/FDcxfb1WGRu
	lThSyNFQYcazGCJmcMeOyc3cMJdHvh2d04bctDNwjJ0Wa0853Ak23IsR4hbpbqTuwsTgvMXABp1
	TS/CH9MJcrCW0vlMJXcu9gpke59go0xmnqw==
X-Gm-Gg: AYBFou0O3EKXjHAPWkGn00hwibzsZthyt7wF/mtzMPXupNfxB7oHcPPRvad9quYHoVI
	KFxa/MeTUGG85uHBqJMga2abXRLkvxaFp3jQlWfOkQi9hH1AqCnZVBj0ORa/vUxAQxN5IjJlEIL
	+P106evFkx7CMoH7jVWmrHp1AVy3VnqgszPxWBMpXD8HAIy42lQm7jOT0QoeCgQ1XsqeWhw33G2
	cpGnKchoKwrVuCyk/MG/MwiBb1Ov/KRQ1KjgZscnTVQ7bptK0PZYak5R49tOKpwbaoJEjy/OeIs
	gQ5AH6TKyvm7M4MH4NxpaXWSZQuEJ7gox3YCna56MEsJ52bjpOJ8/ceEtbXQBbJEbS0IEKme3fk
	FpT0fIZYgoPjm6lfGGb/l4X+19HTRZSit1fR0LSP8FYijnwODSRS6yiU=
X-Received: by 2002:a05:6820:201a:b0:6d7:a13d:fd88 with SMTP id
 006d021491bc7-6df2f9f956fmr1350599eaf.5.1790921073726; Thu, 01 Oct 2026
 23:04:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001143003.755790-1-omermetekaya0@gmail.com>
 <87se2pwhzh.fsf@mailhost.krisman.be> <20874bd2-f827-4ef8-9855-dc8aaec874fa@gmail.com>
In-Reply-To: <20874bd2-f827-4ef8-9855-dc8aaec874fa@gmail.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Fri, 2 Oct 2026 01:04:22 -0500
X-Gm-Features: AclHuK-2gZQmIhwRNDJtA7gikD9hOOnuFgkdKl3Un0Ewa3PUIIoqG4O6oFR_xWQ
Message-ID: <CACVXFVMrjhACs9mQMkJJxYXsTyh=a1ZHUmg1i9hK2+TZdwbXFQ@mail.gmail.com>
Subject: Re: [PATCH] io_uring: fix out-of-bounds bvec access in io_vec_fill_kern_bvec
To: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
Cc: Gabriel Krisman Bertazi <gabriel@krisman.be>, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:55=E2=80=AFPM =C3=96mer Mete Kaya <omermetekaya0@g=
mail.com> wrote:
>
>
>
> On 10/1/26 18:36, Gabriel Krisman Bertazi wrote:
> > =C3=96mer Mete Kaya <omermetekaya0@gmail.com> writes:
> >
> >> for_each_mp_bvec() dereferences src_bvec[bi_idx] in the loop condition
> >> before the body is entered, with no guard against bi_idx reaching
> >> imu->nr_bvecs. iov_kern_bvec_size() stops iterating when i reaches
> >> imu->nr_bvecs even if bi_size is still non-zero, so the fill loop can
> >> walk past the end of the bvec array and overrun res_bvec[].
> >>
> >> Open-code the loop with an explicit bi_idx < imu->nr_bvecs check befor=
e
> >> the dereference, matching the termination condition in
> >> iov_kern_bvec_size().
> >
> > Do you have a reproducer?  This should be checked in iov_kern_bvec_size=
.
> > We make sure it doesn't go through imu->len which should match bv_len,
> > IIUC.
>
> Yes I checked more and looks like the *bug* is unreachable via existing
> in-tree callers.>>
> >> Fixes: 1045afae4b88 ("io_uring: support vectored kernel fixed buffer")
>
> It doesnt fix something broken actually, more like a defensive refactorin=
g.
>
> >> Signed-off-by: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>
> >> ---
> >>  io_uring/rsrc.c | 7 ++++++-
> >>  1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> >> index 51b46e624..3d29a0c7b 100644
> >> --- a/io_uring/rsrc.c
> >> +++ b/io_uring/rsrc.c
> >> @@ -1614,8 +1614,13 @@ static int io_vec_fill_kern_bvec(int ddir, stru=
ct iov_iter *iter,
> >>              struct bio_vec bv;
> >>
> >>              bvec_iter_advance(src_bvec, &bi, offset);
> >> -            for_each_mp_bvec(bv, src_bvec, bi, bi)
> >> +            while (bi.bi_size) {
> >
> > bi.bi_size is the first condition of for_each_mp_bvec.  Do you really
> > need an open coded loop?  If there is an issue, can we just add the
> > check below?
>
> mp_bvec_iter_bvec() is called in the for-loop condition not the body:
>
>     for (iter =3D (start);
>         (iter).bi_size &&
>             ((bvl =3D mp_bvec_iter_bvec((bio_vec), (iter))), 1); <-***
>         bvec_iter_advance_single(...))
>
> src_bvec[bi_idx] is dereferenced before the loop body is entered.
> A check inside the body executes after the out-of-bounds read has
> already occurred. The open-coded loop is the way to check bi_idx
> before the dereference. The question is "should the kernel be defensive
> itself or trust the callers?". If you find these kinds of defensive
> controls unnecessary, happy to withdraw the patch instead of releasing v2=
.

bio/bvec iterator is written in this way from begining.

So it looks you should work on improving the iterator helper, instead of op=
en
code for the single user only.


Thanks,
Ming Lei
